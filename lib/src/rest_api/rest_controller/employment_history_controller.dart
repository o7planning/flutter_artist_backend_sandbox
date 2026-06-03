import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../database/joins/employment_history_with_other_props.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';
import '../form/_form_field_error.dart';
import '../form/employment_history_form.dart';

// *****************************************************************************
// *****************************************************************************

void employmentHistoryRestApiRegister() {
  // /rest/page/employment-history-info/by-employee-id/1
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/page/employment-history-info/by-employee-id/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          // /rest/page/employment-history-info/by-employee-id/1?currentPage=1&pageSize=20
          String url = request.path.split("?").first;
          final employeeId = int.parse(url.split('/').last);
          return await getEmploymentHistoryInfoPage(request, employeeId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/employment-history-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/employment-history-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final employmentHistoryId = int.parse(request.path.split('/').last);
          return await getEmploymentHistoryDetail(request, employmentHistoryId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/employment-history-data/update',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await updateEmploymentHistory(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/employment-history-data/create',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          return await createEmploymentHistory(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/employment-history/delete/\\d+',
      method: 'DELETE',
      handler: (MockRequest request) async {
        try {
          final employmentHistoryId = int.parse(request.path.split('/').last);
          return await deleteEmploymentHistory(request, employmentHistoryId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

// "currentPage": 1,
// "pageSize": 5,
// "searchText": null,
// "employeeId": null,
Future<MockResponse> getEmploymentHistoryInfoPage(
  MockRequest request,
  int employeeId,
) async {
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  final select = db.select(db.employmentHistory);

  final joinedQuery = select.join([
    innerJoin(
      db.employee,
      db.employee.id.equals(employeeId) &
          db.employee.id.equalsExp(db.employmentHistory.employeeId),
    ),
    innerJoin(
      db.employeePosition,
      db.employeePosition.id.equalsExp(db.employmentHistory.employeePositionId),
    ),
    //
    innerJoin(
      db.department,
      db.department.id.equalsExp(db.employmentHistory.departmentId),
    ),
    innerJoin(
      db.company,
      db.company.id.equalsExp(db.employmentHistory.companyId),
    ),
  ]);
  //
  final result = await joinedQuery.get();

  List<EmploymentHistoryWithOtherProps> allItems = result.map((row) {
    final employmentHistory = row.readTable(db.employmentHistory);
    final employee = row.readTable(db.employee);
    final employeePosition = row.readTable(db.employeePosition);
    final department = row.readTable(db.department);
    final company = row.readTable(db.company);
    //
    return EmploymentHistoryWithOtherProps(
      employmentHistory,
      employee,
      company,
      department,
      employeePosition,
    );
  }).toList();

  PageData<EmploymentHistoryWithOtherProps> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allItems,
  );
  PageData<EmploymentHistoryInfo> page = pageData.convert(
    converter: (EmploymentHistoryWithOtherProps empWithPos) {
      return EmploymentHistoryInfo.fromEntity(
        empWithPos.employmentHistory,
        empWithPos.employee,
        empWithPos.company,
        empWithPos.department,
        empWithPos.employeePosition,
      );
    },
  );
  EmploymentHistoryInfoPage p = EmploymentHistoryInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getEmploymentHistoryDetail(
  MockRequest request,
  int employmentHistoryId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  EmploymentHistoryData? entity = await db.employmentHistoryDAO.findById(
    employmentHistoryId,
  );

  if (entity == null) {
    return MockResponse.json({});
  }
  EmployeeData employee = await (db.select(
    db.employee,
  )..where((e) => e.id.equals(entity.employeeId))).getSingle();
  //
  CompanyData company = await (db.select(
    db.company,
  )..where((e) => e.id.equals(entity.companyId))).getSingle();
  //
  DepartmentData department = await (db.select(
    db.department,
  )..where((e) => e.id.equals(entity.departmentId))).getSingle();
  //
  EmployeePositionData employeePosition = await (db.select(
    db.employeePosition,
  )..where((e) => e.id.equals(entity.employeePositionId))).getSingle();
  //
  EmploymentHistoryDetail detail = EmploymentHistoryDetail.fromEntity(
    entity,
    employee,
    company,
    department,
    employeePosition,
  );
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> updateEmploymentHistory(MockRequest request) async {
  FormData formData = request.body;
  final EmploymentHistoryForm form = EmploymentHistoryForm(formData);
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  final EmployeePositionData? employeePosition = await db.employeePositionDAO
      .findById(form.employeePositionId);
  if (employeePosition == null) {
    throw FormFieldError(
      errorMessage: "EmployeePosition ${form.employeePositionId} not found",
    );
  }
  //
  final CompanyData? company = await db.companyDAO.findById(form.companyId);
  if (company == null) {
    throw FormFieldError(errorMessage: "Company ${form.companyId} not found");
  }
  //
  final DepartmentData? department = await db.departmentDAO.findById(
    form.departmentId,
  );
  if (department == null) {
    throw FormFieldError(
      errorMessage: "Department ${form.departmentId} not found",
    );
  }
  //
  final EmployeeData? employee = await db.employeeDAO.findById(form.employeeId);
  if (employee == null) {
    throw FormFieldError(errorMessage: "Employee ${form.employeeId} not found");
  }
  //
  await db.update(db.employmentHistory)
    ..where((u) => u.id.equals(form.id!))
    ..write(
      EmploymentHistoryCompanion(
        employeeId: Value(form.employeeId),
        employeePositionId: Value(form.employeePositionId),
        departmentId: Value(form.departmentId),
        companyId: Value(form.companyId),
        fromDate: Value(form.fromDate),
        toDate: Value(form.toDate),
      ),
    );
  //
  final EmploymentHistoryData? employmentHistory = await db.employmentHistoryDAO
      .findById(form.id!);
  //
  if (employmentHistory == null) {
    return MockResponse.json({});
  } else {
    EmploymentHistoryDetail detail = EmploymentHistoryDetail.fromEntity(
      employmentHistory,
      employee,
      company,
      department,
      employeePosition,
    );
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> createEmploymentHistory(MockRequest request) async {
  FormData formData = request.body;
  final EmploymentHistoryForm form = EmploymentHistoryForm(formData);
  final SharedDatabase db = await getSharedDatabase();
  //
  //
  final EmployeePositionData? employeePosition = await db.employeePositionDAO
      .findById(form.employeePositionId);
  if (employeePosition == null) {
    throw FormFieldError(
      errorMessage: "EmployeePosition ${form.employeePositionId} not found",
    );
  }
  //
  final CompanyData? company = await db.companyDAO.findById(form.companyId);
  if (company == null) {
    throw FormFieldError(errorMessage: "Company ${form.companyId} not found");
  }
  //
  final DepartmentData? department = await db.departmentDAO.findById(
    form.departmentId,
  );
  if (department == null) {
    throw FormFieldError(
      errorMessage: "Department ${form.departmentId} not found",
    );
  }
  //
  final EmployeeData? employee = await db.employeeDAO.findById(form.employeeId);
  if (employee == null) {
    throw FormFieldError(errorMessage: "Employee ${form.employeeId} not found");
  }
  //
  final employmentHistoryId = await db
      .into(db.employmentHistory)
      .insert(
        EmploymentHistoryCompanion.insert(
          employeeId: form.employeeId,
          employeePositionId: form.employeePositionId,
          departmentId: form.departmentId,
          companyId: form.companyId,
          fromDate: form.fromDate,
          toDate: form.toDate,
        ),
      );
  //
  final EmploymentHistoryData? employmentHistory = await db.employmentHistoryDAO
      .findById(employmentHistoryId);
  //
  if (employmentHistory == null) {
    return MockResponse.json({});
  } else {
    EmploymentHistoryDetail detail = EmploymentHistoryDetail.fromEntity(
      employmentHistory,
      employee,
      company,
      department,
      employeePosition,
    );
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> deleteEmploymentHistory(
  MockRequest request,
  int employmentHistoryId,
) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final EmploymentHistoryData? employmentHistory = await db.employmentHistoryDAO
      .findById(employmentHistoryId);
  if (employmentHistory == null) {
    return MockResponse.json({});
  }
  //
  await db.employmentHistoryDAO.deleteById(employmentHistoryId);
  return MockResponse.json({});
}

// *****************************************************************************
// *****************************************************************************
