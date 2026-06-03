part of '../../../database.dart';

@DriftAccessor(tables: [Album])
class AlbumDAO extends DatabaseAccessor<SharedDatabase> with _$AlbumDAOMixin {
  AlbumDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.album)..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<AlbumData?> findById(int albumId) async {
    return await (db.select(
      db.album,
    )..where((e) => e.id.equals(albumId))).getSingleOrNull();
  }

  Future<AlbumData?> findByCode(String code) async {
    return await (db.select(
      db.album,
    )..where((e) => e.code.equals(code))).getSingleOrNull();
  }
}
