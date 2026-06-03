import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../database/joins/teacher_with_other_props.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';

// *****************************************************************************
// *****************************************************************************

void teacherRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/teacher-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getTeacherInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/teacher-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/teacher-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final teacherId = int.parse(request.path.split('/').last);
          return await getTeacherDetail(request, teacherId);
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
// "universityId": null,
Future<MockResponse> getTeacherInfoPage(MockRequest request) async {
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  int? universityId = queryParameters["universityId"];
  //

  final SharedDatabase db = await getSharedDatabase();

  final select = db.select(db.teacher)
    ..where((e) => e.fullName.containsCase(searchText));

  final joinedQuery = select.join([
    innerJoin(
      db.teacherPosition,
      db.teacherPosition.id.equalsExp(db.teacher.teacherPositionId),
    ),
    innerJoin(db.gender, db.gender.id.equalsExp(db.teacher.genderId)),
    //
    if (universityId == null)
      innerJoin(
        db.university,
        db.university.id.equalsExp(db.teacher.universityId),
      ),
    if (universityId != null)
      innerJoin(
        db.university,
        db.university.id.equals(universityId) &
            db.university.id.equalsExp(db.teacher.universityId),
      ),
  ]);
  //
  final result = await joinedQuery.get();

  List<TeacherWithOtherProps> allTeacherWithUniversity = result.map((row) {
    final teacher = row.readTable(db.teacher);
    final gender = row.readTable(db.gender);
    final teacherPosition = row.readTable(db.teacherPosition);
    final university = row.readTable(db.university);
    return TeacherWithOtherProps(teacher, teacherPosition, gender, university);
  }).toList();

  PageData<TeacherWithOtherProps> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allTeacherWithUniversity,
  );
  PageData<TeacherInfo> page = pageData.convert(
    converter: (empWithPos) {
      return TeacherInfo.fromEntity(
        empWithPos.teacher,
        empWithPos.gender,
        empWithPos.teacherPosition,
      );
    },
  );
  TeacherInfoPage p = TeacherInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getTeacherDetail(
  MockRequest request,
  int teacherId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  final TeacherData? entity = await db.teacherDAO.findById(teacherId);

  if (entity == null) {
    return MockResponse.json({});
  }
  GenderData gender = await (db.select(
    db.gender,
  )..where((e) => e.id.equals(entity.genderId))).getSingle();
  //
  TeacherPositionData position = await (db.select(
    db.teacherPosition,
  )..where((e) => e.id.equals(entity.teacherPositionId))).getSingle();
  //
  TeacherDetail detail = TeacherDetail.fromEntity(entity, gender, position);
  return MockResponse.json(detail.toJson());
}
