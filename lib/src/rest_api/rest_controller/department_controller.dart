import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../database/joins/department_with_company.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void departmentRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/department-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getDepartmentInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/page/department-info/all/by-company-id/2
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/page/department-info/all/by-company-id/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final departmentId = int.parse(request.path.split('/').last);
          return await getDepartmentInfoPageByCompanyId(request, departmentId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/department-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/department-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final departmentId = int.parse(request.path.split('/').last);
          return await getDepartmentDetail(request, departmentId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getDepartmentInfoPageByCompanyId(
  MockRequest request,
  int companyId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  final select = db.select(db.department);

  final joinedQuery = select.join([
    innerJoin(
      db.company,
      db.company.id.equals(companyId) &
          db.company.id.equalsExp(db.department.companyId),
    ),
  ]);
  //
  final result = await joinedQuery.get();

  List<DepartmentWithCompany> allDepartmentWithCompany = result.map((row) {
    final department = row.readTable(db.department);
    final company = row.readTable(db.company);
    return DepartmentWithCompany(department, company);
  }).toList();

  List<DepartmentInfo> departmentInfos = allDepartmentWithCompany
      .map((e) => e.department)
      .map((d) => DepartmentInfo.fromEntity(d))
      .toList();

  DepartmentInfoPage p = DepartmentInfoPage(
    items: departmentInfos,
    paginationInfo: null,
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// "currentPage": 1,
// "pageSize": 5,
// "searchText": null,
// "companyId": null,
Future<MockResponse> getDepartmentInfoPage(MockRequest request) async {
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  int? companyId = queryParameters["companyId"];
  //
  final SharedDatabase db = await getSharedDatabase();

  final select = db.select(db.department)
    ..where((e) => e.name.containsCase(searchText));

  final joinedQuery = select.join([
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

  List<DepartmentWithCompany> allDepartmentWithCompany = result.map((row) {
    final department = row.readTable(db.department);
    final company = row.readTable(db.company);
    return DepartmentWithCompany(department, company);
  }).toList();

  PageData<DepartmentWithCompany> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allDepartmentWithCompany,
  );
  PageData<DepartmentInfo> page = pageData.convert(
    converter: (empWithPos) {
      return DepartmentInfo.fromEntity(empWithPos.department);
    },
  );
  DepartmentInfoPage p = DepartmentInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getDepartmentDetail(
  MockRequest request,
  int departmentId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  DepartmentData? entity = await db.departmentDAO.findById(departmentId);

  if (entity == null) {
    return MockResponse.json({});
  }
  //
  DepartmentDetail detail = DepartmentDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}
