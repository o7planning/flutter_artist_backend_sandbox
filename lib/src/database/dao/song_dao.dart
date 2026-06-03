part of '../../../database.dart';

@DriftAccessor(tables: [Song])
class SongDAO extends DatabaseAccessor<SharedDatabase> with _$SongDAOMixin {
  SongDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.song)..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<SongData?> findById(int songId) async {
    return await (db.select(
      db.song,
    )..where((e) => e.id.equals(songId))).getSingleOrNull();
  }
}
