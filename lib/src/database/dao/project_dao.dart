part of '../../../database.dart';

@DriftAccessor(tables: [Project])
class ProjectDAO extends DatabaseAccessor<SharedDatabase>
    with _$ProjectDAOMixin {
  ProjectDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.project)..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<ProjectData?> findById(int projectId) async {
    return await (db.select(
      db.project,
    )..where((e) => e.id.equals(projectId))).getSingleOrNull();
  }

  Future<int> deleteById(int projectId) async {
    return await (db.delete(
      db.project,
    )..where((e) => e.id.equals(projectId))).go();
  }
}
