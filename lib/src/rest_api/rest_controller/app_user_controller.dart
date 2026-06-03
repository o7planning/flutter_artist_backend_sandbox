import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void appUserRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/appUserInfoPage',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getAppUserInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/appUser/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/appUser/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final appUserId = int.parse(request.path.split('/').last);
          return await getAppUserDetail(request, appUserId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getAppUserInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<AppUserData> allAppUserDatas = await (db.select(
    db.appUser,
  )..where((e) => e.userName.containsCase(searchText))).get();
  //
  PageData<AppUserData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allAppUserDatas,
  );
  PageData<AppUserInfo> page = pageData.convert(
    converter: (appUserData) => AppUserInfo.fromEntity(appUserData),
  );
  AppUserInfoPage p = AppUserInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// AppUserDetail.
Future<MockResponse> getAppUserDetail(
  MockRequest request,
  int appUserId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  AppUserData? entity = await db.appUserDAO.findById(appUserId);

  if (entity == null) {
    return MockResponse.json({});
  }
  final EmployeeData? employee = entity.employeeId == null
      ? null
      : await db.employeeDAO.findById(entity.employeeId!);
  final EmployeePositionData? position;
  if (employee != null) {
    position = await db.employeePositionDAO.findById(
      employee.employeePositionId,
    );
  } else {
    position = null;
  }

  AppUserDetail detail = AppUserDetail.fromEntity(entity, employee, position);
  return MockResponse.json(detail.toJson());
}
