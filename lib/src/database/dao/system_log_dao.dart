part of '../../../database.dart';

@DriftAccessor(tables: [SystemLog])
class SystemLogDAO extends DatabaseAccessor<SharedDatabase>
    with _$SystemLogDAOMixin {
  SystemLogDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.systemLog)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<SystemLogData?> findById(int systemLogId) async {
    return await (db.select(
      db.systemLog,
    )..where((e) => e.id.equals(systemLogId))).getSingleOrNull();
  }

  Future<int> deleteById(int systemLogId) async {
    return await (db.delete(
      db.systemLog,
    )..where((e) => e.id.equals(systemLogId))).go();
  }
}
