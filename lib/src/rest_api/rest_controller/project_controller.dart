import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void projectRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/project-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getProjectInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/project-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getProjectInfoPageAll(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/project-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/project-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final projectId = int.parse(request.path.split('/').last);
          return await getProjectDetail(request, projectId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getProjectInfoPageAll(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  List<ProjectData> allProjectDatas = await (db.select(db.project)).get();
  //
  List<ProjectInfo> projectInfos = allProjectDatas
      .map((e) => ProjectInfo.fromEntity(e))
      .toList();

  ProjectInfoPage p = ProjectInfoPage(
    items: projectInfos,
    paginationInfo: null,
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getProjectInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<ProjectData> allProjectDatas = await (db.select(
    db.project,
  )..where((e) => e.name.containsCase(searchText))).get();
  //
  PageData<ProjectData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allProjectDatas,
  );
  PageData<ProjectInfo> page = pageData.convert(
    converter: (projectData) => ProjectInfo.fromEntity(projectData),
  );
  ProjectInfoPage p = ProjectInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// ProjectDetail.
Future<MockResponse> getProjectDetail(
  MockRequest request,
  int projectId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  ProjectData? entity = await db.projectDAO.findById(projectId);

  if (entity == null) {
    return MockResponse.json({});
  }
  ProjectDetail detail = ProjectDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************
