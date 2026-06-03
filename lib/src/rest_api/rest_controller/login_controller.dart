import 'package:dio/dio.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/api_error.dart';
import '../../model/model.dart';
import '../../utils/form_data_utils.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void loginRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/auth/login',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          return await doLogin(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

// LoggedInUserData
Future<MockResponse> doLogin(MockRequest request) async {
  FormData formData = request.body as FormData;
  String? userNameOrEmail = FormDataUtils.getString(
    formData,
    "userNameOrEmail",
  );
  String? password = FormDataUtils.getString(formData, "password");

  if (userNameOrEmail == null) {
    throw Exception("No User name or Password");
  }

  final SharedDatabase db = await getSharedDatabase();

  AppUserData? appUserData = await db.appUserDAO.findByUserName(
    userNameOrEmail,
  );

  if (appUserData == null) {
    return MockResponse.json(
      ApiError(errorMessage: "No User name or Password").toJson(),
      statusCode: 500,
    );
  } else if (appUserData.encryptedPassword != password) {
    return MockResponse.json(
      ApiError(errorMessage: "Invalid User name or Password").toJson(),
      statusCode: 500,
    );
  }
  final EmployeeData? employee = appUserData.employeeId == null
      ? null
      : await db.employeeDAO.findById(appUserData.employeeId!);
  final EmployeePositionData? position;
  if (employee == null) {
    position = null;
  } else {
    position = await db.employeePositionDAO.findById(
      employee.employeePositionId,
    );
  }
  AppUserDetail user = AppUserDetail.fromEntity(
    appUserData,
    employee,
    position,
  );
  LoggedInUserData loggedInUserData = LoggedInUserData.named(
    appUser: user,
    accessToken: "No Need Access Token for Mock Backend Server.",
    expiresIn: null,
    refreshToken: null,
    scope: null,
    tokenType: null,
  );
  return MockResponse.json(loggedInUserData.toJson());
}

// *****************************************************************************
// *****************************************************************************
