part of '../../../database.dart';

@DriftAccessor(tables: [FootballPlayer])
class FootballPlayerDAO extends DatabaseAccessor<SharedDatabase>
    with _$FootballPlayerDAOMixin {
  FootballPlayerDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.footballPlayer)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<FootballPlayerData?> findById(int footballPlayerId) async {
    return await (db.select(
      db.footballPlayer,
    )..where((e) => e.id.equals(footballPlayerId))).getSingleOrNull();
  }

  Future<int> deleteById(int footballPlayerId) async {
    return await (db.delete(
      db.footballPlayer,
    )..where((e) => e.id.equals(footballPlayerId))).go();
  }
}
