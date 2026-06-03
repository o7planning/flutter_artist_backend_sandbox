import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void systemLogRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/system-log-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getSystemLogInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/system-log-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/system-log-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final systemLogId = int.parse(request.path.split('/').last);
          return await getSystemLogDetail(request, systemLogId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/system-log/delete/\\d+',
      method: 'DELETE',
      handler: (MockRequest request) async {
        try {
          final systemLogId = int.parse(request.path.split('/').last);
          return await deleteSystemLog(request, systemLogId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getSystemLogInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<SystemLogData> allSystemLogDatas = await (db.select(
    db.systemLog,
  )..where((e) => e.content.containsCase(searchText))).get();
  //
  PageData<SystemLogData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allSystemLogDatas,
  );
  PageData<SystemLogInfo> page = pageData.convert(
    converter: (systemLogData) => SystemLogInfo.fromEntity(systemLogData),
  );
  SystemLogInfoPage p = SystemLogInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// SystemLogDetail.
Future<MockResponse> getSystemLogDetail(
  MockRequest request,
  int systemLogId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  final SystemLogData? entity = await db.systemLogDAO.findById(systemLogId);
  //

  if (entity == null) {
    return MockResponse.json({});
  }
  SystemLogDetail detail = SystemLogDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> deleteSystemLog(
  MockRequest request,
  int systemLogId,
) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final SystemLogData? systemLog = await db.systemLogDAO.findById(systemLogId);
  if (systemLog == null) {
    return MockResponse.json({});
  }
  //
  await db.systemLogDAO.deleteById(systemLogId);
  return MockResponse.json({});
}

// *****************************************************************************
// *****************************************************************************
