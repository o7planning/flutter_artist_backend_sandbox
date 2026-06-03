part of '../../../database.dart';

@DriftAccessor(tables: [EmploymentHistory])
class EmploymentHistoryDAO extends DatabaseAccessor<SharedDatabase>
    with _$EmploymentHistoryDAOMixin {
  EmploymentHistoryDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.employmentHistory)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<EmploymentHistoryData?> findById(int employmentHistoryId) async {
    return await (db.select(
      db.employmentHistory,
    )..where((e) => e.id.equals(employmentHistoryId))).getSingleOrNull();
  }

  Future<int> deleteById(int employmentHistoryId) async {
    return await (db.delete(
      db.employmentHistory,
    )..where((e) => e.id.equals(employmentHistoryId))).go();
  }
}
