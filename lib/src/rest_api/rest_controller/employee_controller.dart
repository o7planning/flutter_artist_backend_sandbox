import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../database/_global_base64_image.dart';
import '../../database/joins/employee_with_position.dart';
import '../../database/utils/drift_filter_parser.dart';
import '../../model/model.dart';
import '../../utils/email_checker_utils.dart';
import '../../utils/mock_response_utils.dart';
import '../field_mapping/employee_field_mapping.dart';
import '../form/_form_field_error.dart';
import '../form/employee_form.dart';

// *****************************************************************************
// *****************************************************************************

void employeeRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/features/field-based-json/page/employee-info/59ab',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getEmployeeInfoPageByJSON59ab(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/features/field-based-json/page/employee-info/59c',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getEmployeeInfoPageByJSON59c(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/employee-info/adv-search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getEmployeeInfoPageAdv(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/page/employee-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getEmployeeInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/employee-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/employee-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final employeeId = int.parse(request.path.split('/').last);
          return await getEmployeeDetail(request, employeeId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/employee-data/update',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await updateEmployee(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/employee-data/create',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          return await createEmployee(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/employee/delete/\\d+',
      method: 'DELETE',
      handler: (MockRequest request) async {
        try {
          final employeeId = int.parse(request.path.split('/').last);
          return await deleteEmployee(request, employeeId);
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
// "pageSize": 20,
// "searchText": null,
// "companyId": 1,
// "departmentIdsAsString": "1,2,3"
Future<MockResponse> getEmployeeInfoPageAdv(MockRequest request) async {
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  int? companyId = queryParameters["companyId"];
  String? departmentIdsAsString = queryParameters["departmentIdsAsString"];
  //
  List<String> idStrs = departmentIdsAsString == null
      ? []
      : departmentIdsAsString.split(",");
  List<int> departmentIds = [];
  for (String idStr in idStrs) {
    int? id = int.tryParse(idStr.trim());
    if (id != null) {
      departmentIds.add(id);
    }
  }
  //
  final SharedDatabase db = await getSharedDatabase();

  final select = db.select(db.employee)
    ..where((e) => e.name.containsCase(searchText));

  final joinedQuery = select.join([
    innerJoin(
      db.employeePosition,
      db.employeePosition.id.equalsExp(db.employee.employeePositionId),
    ),
    if (departmentIds.isEmpty)
      innerJoin(
        db.department,
        db.department.id.equalsExp(db.employee.departmentId),
      ),
    if (departmentIds.isNotEmpty)
      innerJoin(
        db.department,
        db.department.id.isIn(departmentIds) &
            db.department.id.equalsExp(db.employee.departmentId),
      ),
    if (companyId == null)
      innerJoin(db.company, db.company.id.equalsExp(db.department.companyId)),
    if (companyId != null)
      innerJoin(
        db.company,
        db.company.id.equals(companyId) &
            db.company.id.equalsExp(db.department.companyId),
      ),
  ]);
  //
  final result = await joinedQuery.get();

  List<EmployeeWithPosition> allEmpWithPos = result.map((row) {
    final employee = row.readTable(db.employee);
    final position = row.readTable(db.employeePosition);
    final department = row.readTable(db.department);
    final company = row.readTable(db.company);
    return EmployeeWithPosition(employee, position);
  }).toList();

  PageData<EmployeeWithPosition> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allEmpWithPos,
  );
  PageData<EmployeeInfo> page = pageData.convert(
    converter: (empWithPos) {
      return EmployeeInfo.fromEntity(
        empWithPos.employee,
        empWithPos.employeePosition,
      );
    },
  );
  EmployeeInfoPage p = EmployeeInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// "currentPage": 1,
// "pageSize": 5,
// "searchText": null,
// "companyId": null,
// "departmentId": null
Future<MockResponse> getEmployeeInfoPage(MockRequest request) async {
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  int? companyId = queryParameters["companyId"];
  int? departmentId = queryParameters["departmentId"];
  //
  final SharedDatabase db = await getSharedDatabase();

  final select = db.select(db.employee)
    ..where((e) => e.name.containsCase(searchText));

  final joinedQuery = select.join([
    innerJoin(
      db.employeePosition,
      db.employeePosition.id.equalsExp(db.employee.employeePositionId),
    ),
    if (departmentId == null)
      innerJoin(
        db.department,
        db.department.id.equalsExp(db.employee.departmentId),
      ),
    if (departmentId != null)
      innerJoin(
        db.department,
        db.department.id.equals(departmentId) &
            db.department.id.equalsExp(db.employee.departmentId),
      ),
    if (companyId == null)
      innerJoin(db.company, db.company.id.equalsExp(db.department.companyId)),
    if (companyId != null)
      innerJoin(
        db.company,
        db.company.id.equals(companyId) &
            db.company.id.equalsExp(db.department.companyId),
      ),
  ]);
  //
  final result = await joinedQuery.get();

  List<EmployeeWithPosition> allEmpWithPos = result.map((row) {
    final employee = row.readTable(db.employee);
    final position = row.readTable(db.employeePosition);
    final department = row.readTable(db.department);
    final company = row.readTable(db.company);
    return EmployeeWithPosition(employee, position);
  }).toList();

  PageData<EmployeeWithPosition> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allEmpWithPos,
  );
  PageData<EmployeeInfo> page = pageData.convert(
    converter: (empWithPos) {
      return EmployeeInfo.fromEntity(
        empWithPos.employee,
        empWithPos.employeePosition,
      );
    },
  );
  EmployeeInfoPage p = EmployeeInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getEmployeeDetail(
  MockRequest request,
  int employeeId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  EmployeeData? entity = await db.employeeDAO.findById(employeeId);

  if (entity == null) {
    return MockResponse.json({});
  }
  EmployeePositionData positionData = await (db.select(
    db.employeePosition,
  )..where((e) => e.id.equals(entity.employeePositionId))).getSingle();
  //
  EmployeeDetail detail = EmployeeDetail.fromEntity(entity, positionData);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> updateEmployee(MockRequest request) async {
  FormData formData = request.body;
  final EmployeeForm form = EmployeeForm(formData);
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  final EmployeePositionData? employeeType = await db.employeePositionDAO
      .findById(form.employeePositionId);
  if (employeeType == null) {
    throw FormFieldError(
      errorMessage: "EmployeePosition ${form.employeePositionId} not found",
    );
  }
  //
  EmailCheckerUtils.checkEmail(form.email);
  EmployeeData? employeeInDB = await db.employeeDAO.findByEmail(form.email);
  if (employeeInDB != null && employeeInDB.id != form.id!) {
    throw AppError(errorMessage: "Duplicate email ${form.email}");
  }
  //
  employeeInDB = await db.employeeDAO.findByEmpNumber(form.empNumber);
  if (employeeInDB != null && employeeInDB.id != form.id!) {
    throw AppError(errorMessage: "Duplicate EmpNumber ${form.empNumber}");
  }
  //
  //
  await db.update(db.employee)
    ..where((u) => u.id.equals(form.id!))
    ..write(
      EmployeeCompanion(
        name: Value(form.name),
        email: Value(form.email),
        empNumber: Value(form.empNumber),
        employeePositionId: Value(form.employeePositionId),
        address: Value(form.address),
        departmentId: const Value.absent(),
        birthday: Value(form.birthday),
        hireDate: Value(form.hireDate),
        imagePath: const Value.absent(),
      ),
    );
  //
  await storeEmployeeBase64Image(form.id!, form.multipartFile);
  //
  final EmployeeData? employee = await db.employeeDAO.findById(form.id!);
  //
  if (employee == null) {
    return MockResponse.json({});
  } else {
    EmployeeDetail detail = EmployeeDetail.fromEntity(employee, employeeType);
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> createEmployee(MockRequest request) async {
  throw AppError(errorMessage: "Employee Creation is not supported!");
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> deleteEmployee(MockRequest request, int employeeId) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final EmployeeData? employee = await db.employeeDAO.findById(employeeId);
  if (employee == null) {
    return MockResponse.json({});
  }
  //
  await db.employeeDAO.deleteById(employeeId);
  return MockResponse.json({});
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getEmployeeInfoPageByJSON59ab(MockRequest request) async {
  Map<String, dynamic> queryParameters = request.query;
  int currentPage =
      int.tryParse(queryParameters["currentPage"]?.toString() ?? '1') ?? 1;
  int pageSize =
      int.tryParse(queryParameters["pageSize"]?.toString() ?? '10') ?? 10;

  String fieldBasedJSONRaw = queryParameters["fieldBasedJSON"] ?? "{}";
  Map<String, dynamic> filterMap = jsonDecode(fieldBasedJSONRaw);

  final SharedDatabase db = await getSharedDatabase();

  final parser = DriftFilterParser(db);
  final whereExpression = parser.parse(
    filterMap,
    EmployeeFieldMapping.fieldToColumnMap(db),
  );

  final query = db.select(db.employee).join([
    innerJoin(
      db.department,
      db.department.id.equalsExp(db.employee.departmentId),
    ),
    innerJoin(
      db.employeePosition,
      db.employeePosition.id.equalsExp(db.employee.employeePositionId),
    ),
    innerJoin(db.company, db.company.id.equalsExp(db.department.companyId)),
  ]);

  query.where(whereExpression);

  final result = await query.get();

  List<EmployeeInfo> allItems = result.map((row) {
    final employee = row.readTable(db.employee);
    final position = row.readTable(db.employeePosition);
    final department = row.readTable(db.department);
    return EmployeeInfo.fromEntity(employee, position);
  }).toList();

  PageData<EmployeeInfo> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allItems,
  );

  EmployeeInfoPage p = EmployeeInfoPage(
    items: pageData.items,
    paginationInfo: PaginationInfoImpl.fromPagination(pageData.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

Future<MockResponse> getEmployeeInfoPageByJSON59c(MockRequest request) async {
  // 1. Extract and normalize pagination parameters
  Map<String, dynamic> queryParameters = request.query;
  int currentPage =
      int.tryParse(queryParameters["currentPage"]?.toString() ?? '1') ?? 1;
  int pageSize =
      int.tryParse(queryParameters["pageSize"]?.toString() ?? '10') ?? 10;

  // 2. Decode the FieldBased JSON from request
  String fieldBasedJSONRaw = queryParameters["fieldBasedJSON"] ?? "{}";
  Map<String, dynamic> filterMap = jsonDecode(fieldBasedJSONRaw);

  final SharedDatabase db = await getSharedDatabase();

  // 3. Initialize our smart parser and generate the WHERE expression
  final parser = DriftFilterParser(db);
  final whereExpression = parser.parse(
    filterMap,
    EmployeeFieldMapping.fieldToColumnMap(db),
  );

  // 4. Build the joined query.
  // We include Company table to support "companyId" filtering in the JSON
  final query = db.select(db.employee).join([
    innerJoin(
      db.department,
      db.department.id.equalsExp(db.employee.departmentId),
    ),
    innerJoin(
      db.employeePosition,
      db.employeePosition.id.equalsExp(db.employee.employeePositionId),
    ),
    innerJoin(db.company, db.company.id.equalsExp(db.department.companyId)),
  ]);

  // 5. Apply the dynamic conditions generated by the parser
  query.where(whereExpression);

  // 6. Execute query and fetch results
  final rows = await query.get();

  // 7. Transform DB rows into EmployeeInfo domain models
  List<EmployeeInfo> allItems = rows.map((row) {
    final employee = row.readTable(db.employee);
    final position = row.readTable(db.employeePosition);
    final department = row.readTable(db.department);
    // Even though we join Company for filtering,
    // we map to EmployeeInfo based on your existing architecture
    return EmployeeInfo.fromEntity(employee, position);
  }).toList();

  // 8. Handle local pagination using your PageData utility
  PageData<EmployeeInfo> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allItems,
  );

  // 9. Wrap into the standard Artist SDK response format
  EmployeeInfoPage responsePage = EmployeeInfoPage(
    items: pageData.items,
    paginationInfo: PaginationInfoImpl.fromPagination(pageData.paginationInfo),
  );

  return MockResponse.json(responsePage.toJson());
}
