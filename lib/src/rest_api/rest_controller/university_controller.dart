import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void universityRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/university-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getUniversityInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/university-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getUniversityInfoPageAll(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/university-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/university-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final universityId = int.parse(request.path.split('/').last);
          return await getUniversityDetail(request, universityId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getUniversityInfoPageAll(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  List<UniversityData> allUniversityDatas = await (db.select(
    db.university,
  )).get();
  //
  List<UniversityInfo> universityInfos = allUniversityDatas
      .map((e) => UniversityInfo.fromEntity(e))
      .toList();

  UniversityInfoPage p = UniversityInfoPage(
    items: universityInfos,
    paginationInfo: null,
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getUniversityInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<UniversityData> allUniversityDatas = await (db.select(
    db.university,
  )..where((e) => e.name.containsCase(searchText))).get();
  //
  PageData<UniversityData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allUniversityDatas,
  );
  PageData<UniversityInfo> page = pageData.convert(
    converter: (universityData) => UniversityInfo.fromEntity(universityData),
  );
  UniversityInfoPage p = UniversityInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// UniversityDetail.
Future<MockResponse> getUniversityDetail(
  MockRequest request,
  int universityId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  final UniversityData? entity = await db.universityDAO.findById(universityId);

  if (entity == null) {
    return MockResponse.json({});
  }
  UniversityDetail detail = UniversityDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************
