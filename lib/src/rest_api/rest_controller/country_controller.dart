import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void countryRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/country-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getCountryInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );

  // /rest/record/country-data/USD
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/country-data/\\w+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final countryId = request.path.split('/').last;
          return await getCountryDetail(request, countryId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getCountryInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null,
  // "jsonSortableCriteria": '{"nameInEnglish":"desc"}' (population,area).
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  String jsonSortableCriteria = queryParameters["jsonSortableCriteria"] ?? "{}";

  Map<String, dynamic> sortableMap = {};
  try {
    sortableMap = jsonDecode(jsonSortableCriteria);
  } catch (e) {}
  //
  final SharedDatabase db = await getSharedDatabase();

  final query = db.select(db.country)
    ..where((e) => e.name.containsCase(searchText));
  //
  List<OrderingTerm Function($CountryTable)> terms = [];
  for (String propName in sortableMap.keys) {
    String direction = sortableMap[propName]!;
    if (propName == "nameInEnglish") {
      terms.add(
        (t) => OrderingTerm(
          expression: t.nameInEnglish,
          mode: direction == "asc" ? OrderingMode.asc : OrderingMode.desc,
        ),
      );
    } else if (propName == "population") {
      terms.add(
        (t) => OrderingTerm(
          expression: t.population,
          mode: direction == "asc" ? OrderingMode.asc : OrderingMode.desc,
        ),
      );
    } else if (propName == "area") {
      terms.add(
        (t) => OrderingTerm(
          expression: t.area,
          mode: direction == "asc" ? OrderingMode.asc : OrderingMode.desc,
        ),
      );
    }
  }
  //
  if (terms.isNotEmpty) {
    query.orderBy(terms);
  }
  //
  List<CountryData> allCountryDatas = await query.get();
  //
  PageData<CountryData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allCountryDatas,
  );
  PageData<CountryInfo> page = pageData.convert(
    converter: (countryData) => CountryInfo.fromEntity(countryData),
  );
  CountryInfoPage p = CountryInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// CountryDetail.
Future<MockResponse> getCountryDetail(
  MockRequest request,
  String countryId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  CountryData? entity = await db.countryDAO.findById(countryId);

  if (entity == null) {
    return MockResponse.json({});
  }
  CountryDetail detail = CountryDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************
