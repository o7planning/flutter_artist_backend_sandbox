part of '../../../database.dart';

@DriftAccessor(tables: [TeacherPosition])
class TeacherPositionDAO extends DatabaseAccessor<SharedDatabase>
    with _$TeacherPositionDAOMixin {
  TeacherPositionDAO(super.db);

  Future<TeacherPositionData?> findById(String teacherPositionId) async {
    return await (db.select(
      db.teacherPosition,
    )..where((e) => e.id.equals(teacherPositionId))).getSingleOrNull();
  }
}
