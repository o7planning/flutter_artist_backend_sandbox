part of '../../../database.dart';

@DriftAccessor(tables: [Note])
class NoteDAO extends DatabaseAccessor<SharedDatabase> with _$NoteDAOMixin {
  NoteDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.note)..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<NoteData?> findById(int noteId) async {
    return await (db.select(
      db.note,
    )..where((e) => e.id.equals(noteId))).getSingleOrNull();
  }

  Future<int> deleteById(int noteId) async {
    return await (db.delete(db.note)..where((e) => e.id.equals(noteId))).go();
  }
}
