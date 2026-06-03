import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void categoryRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/category-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getCategoryInfoPageAll(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/category-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getCategoryInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/category-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/category-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final categoryId = int.parse(request.path.split('/').last);
          return await getCategoryDetail(request, categoryId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getCategoryInfoPageAll(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  List<CategoryData> allCategoryDatas = await (db.select(db.category)).get();
  //
  List<CategoryInfo> categoryInfos = allCategoryDatas
      .map((e) => CategoryInfo.fromEntity(e))
      .toList();

  CategoryInfoPage p = CategoryInfoPage(
    items: categoryInfos,
    paginationInfo: null,
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getCategoryInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<CategoryData> allCategoryDatas = await (db.select(
    db.category,
  )..where((e) => e.name.containsCase(searchText))).get();
  //
  PageData<CategoryData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allCategoryDatas,
  );
  PageData<CategoryInfo> page = pageData.convert(
    converter: (categoryData) => CategoryInfo.fromEntity(categoryData),
  );
  CategoryInfoPage p = CategoryInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// CategoryDetail.
Future<MockResponse> getCategoryDetail(
  MockRequest request,
  int categoryId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  CategoryData? entity = await db.categoryDAO.findById(categoryId);

  if (entity == null) {
    return MockResponse.json({});
  }
  CategoryDetail detail = CategoryDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************
