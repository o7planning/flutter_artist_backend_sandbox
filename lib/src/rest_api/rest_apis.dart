import 'package:dio/dio.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import 'rest_controller/album_controller.dart';
import 'rest_controller/app_user_controller.dart';
import 'rest_controller/best_selling_controller.dart';
import 'rest_controller/category_controller.dart';
import 'rest_controller/company_controller.dart';
import 'rest_controller/contributor_controller.dart';
import 'rest_controller/country_controller.dart';
import 'rest_controller/currency_controller.dart';
import 'rest_controller/customer_controller.dart';
import 'rest_controller/department_controller.dart';
import 'rest_controller/employee_controller.dart';
import 'rest_controller/employee_position_controller.dart';
import 'rest_controller/employment_history_controller.dart';
import 'rest_controller/football_player_controller.dart';
import 'rest_controller/login_controller.dart';
import 'rest_controller/note_controller.dart';
import 'rest_controller/product_controller.dart';
import 'rest_controller/project_controller.dart';
import 'rest_controller/sales_order_controller.dart';
import 'rest_controller/sales_order_line_controller.dart';
import 'rest_controller/song_controller.dart';
import 'rest_controller/supplier_controller.dart';
import 'rest_controller/supplier_type_controller.dart';
import 'rest_controller/system_log_controller.dart';
import 'rest_controller/system_report_controller.dart';
import 'rest_controller/teacher_controller.dart';
import 'rest_controller/university_controller.dart';

// *****************************************************************************
// *****************************************************************************

void setupMockRestApis() {
  loginRestApiRegister();
  currencyRestApiRegister();
  categoryRestApiRegister();
  appUserRestApiRegister();
  productRestApiRegister();
  systemReportRestApiRegister();
  salesOrderRestApiRegister();
  salesOrderLineRestApiRegister();
  employeeRestApiRegister();
  songRestApiRegister();
  albumRestApiRegister();
  companyRestApiRegister();
  departmentRestApiRegister();
  teacherRestApiRegister();
  universityRestApiRegister();
  countryRestApiRegister();
  systemLogRestApiRegister();
  supplierRestApiRegister();
  supplierTypeRestApiRegister();
  bestSellingRestApiRegister();
  footballPlayerRestApiRegister();
  employmentHistoryRestApiRegister();
  employeePositionRestApiRegister();
  customerRestApiRegister();
  projectRestApiRegister();
  contributorRestApiRegister();
  noteRestApiRegister();
}

// *****************************************************************************
// *****************************************************************************

Dio? __dio;

Dio getFlutterArtistDemoMockDio() {
  if (__dio == null) {
    setupMockRestApis();
    __dio = Dio(BaseOptions(baseUrl: "https://example.com"));

    final mockEngine = MockHttpEngine();
    __dio!.interceptors.add(MockInterceptor(engine: mockEngine));
  }
  return __dio!;
}

// *****************************************************************************
// *****************************************************************************

MockInterceptor getFlutterArtistBackendSandboxInterceptor() {
  setupMockRestApis();
  final mockEngine = MockHttpEngine();
  return MockInterceptor(engine: mockEngine);
}

// *****************************************************************************
// *****************************************************************************
