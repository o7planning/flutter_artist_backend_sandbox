import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void companyRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/company-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getCompanyInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/company-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getCompanyInfoPageAll(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/tree/company
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/tree/company',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getCompanyTree(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/company-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/company-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final companyId = int.parse(request.path.split('/').last);
          return await getCompanyDetail(request, companyId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getCompanyInfoPageAll(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  List<CompanyData> allCompanyDatas = await (db.select(db.company)).get();
  //
  List<CompanyInfo> companyInfos = allCompanyDatas
      .map((e) => CompanyInfo.fromEntity(e))
      .toList();

  CompanyInfoPage p = CompanyInfoPage(
    items: companyInfos,
    paginationInfo: null,
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getCompanyInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<CompanyData> allCompanyDatas = await (db.select(
    db.company,
  )..where((e) => e.name.containsCase(searchText))).get();
  //
  PageData<CompanyData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allCompanyDatas,
  );
  PageData<CompanyInfo> page = pageData.convert(
    converter: (companyData) => CompanyInfo.fromEntity(companyData),
  );
  CompanyInfoPage p = CompanyInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// CompanyTree.
Future<MockResponse> getCompanyTree(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();
  List<CompanyData> companies = await (db.select(db.company)).get();

  List<CompanyTreeItem> items = companies
      .map((c) => CompanyTreeItem.fromEntity(c))
      .toList();

  Map<int, CompanyTreeItem> itemMap = {for (var item in items) item.id: item};
  List<CompanyTreeItem> rootItems = [];
  for (CompanyData c in companies) {
    CompanyTreeItem item = itemMap[c.id]!;
    if (c.companyIdParent == null) {
      rootItems.add(item);
    } else {
      CompanyTreeItem parentItem = itemMap[c.companyIdParent]!;
      parentItem.children.add(item);
    }
  }
  CompanyTree tree = CompanyTree.roots(rootItems);
  return MockResponse.json(tree.toJson());
}

// *****************************************************************************
// *****************************************************************************

// CompanyDetail.
Future<MockResponse> getCompanyDetail(
  MockRequest request,
  int companyId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  CompanyData? entity = await db.companyDAO.findById(companyId);

  if (entity == null) {
    return MockResponse.json({});
  }
  CompanyDetail detail = CompanyDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************
