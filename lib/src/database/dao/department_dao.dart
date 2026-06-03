part of '../../../database.dart';

@DriftAccessor(tables: [Department])
class DepartmentDAO extends DatabaseAccessor<SharedDatabase>
    with _$DepartmentDAOMixin {
  DepartmentDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.department)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<DepartmentData?> findById(int departmentId) async {
    return await (db.select(
      db.department,
    )..where((e) => e.id.equals(departmentId))).getSingleOrNull();
  }

  Future<DepartmentData?> findByCode(String code) async {
    return await (db.select(
      db.department,
    )..where((e) => e.code.equals(code))).getSingleOrNull();
  }
}
