import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void currencyRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/currency-data/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getCurrencyDataPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/currency-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getCurrencyInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/currency-data/USD
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/currency-data/\\w+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final currencyId = request.path.split('/').last;
          return await getCurrencyDetail(request, currencyId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getCurrencyInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<CurrencyData> allCurrencyDatas = await (db.select(
    db.currency,
  )..where((e) => e.name.containsCase(searchText))).get();
  //
  PageData<CurrencyData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allCurrencyDatas,
  );
  PageData<CurrencyInfo> page = pageData.convert(
    converter: (currencyData) => CurrencyInfo.fromEntity(currencyData),
  );
  CurrencyInfoPage p = CurrencyInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getCurrencyDataPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<CurrencyData> allCurrencyDatas = await (db.select(
    db.currency,
  )..where((e) => e.name.containsCase(searchText))).get();
  //
  PageData<CurrencyData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allCurrencyDatas,
  );
  PageData<CurrencyDetail> page = pageData.convert(
    converter: (currencyData) => CurrencyDetail.fromEntity(currencyData),
  );
  CurrencyDetailPage p = CurrencyDetailPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// CurrencyDetail.
Future<MockResponse> getCurrencyDetail(
  MockRequest request,
  String currencyId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  CurrencyData? entity = await db.currencyDAO.findById(currencyId);

  if (entity == null) {
    return MockResponse.json({});
  }
  CurrencyDetail detail = CurrencyDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************
