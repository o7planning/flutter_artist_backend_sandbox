part of '../../../database.dart';

@DriftAccessor(tables: [Teacher])
class TeacherDAO extends DatabaseAccessor<SharedDatabase>
    with _$TeacherDAOMixin {
  TeacherDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.teacher)..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<TeacherData?> findById(int teacherId) async {
    return await (db.select(
      db.teacher,
    )..where((e) => e.id.equals(teacherId))).getSingleOrNull();
  }
}
