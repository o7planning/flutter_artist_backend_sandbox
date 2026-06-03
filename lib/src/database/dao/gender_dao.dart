part of '../../../database.dart';

@DriftAccessor(tables: [Gender])
class GenderDAO extends DatabaseAccessor<SharedDatabase> with _$GenderDAOMixin {
  GenderDAO(super.db);

  Future<GenderData?> findById(String genderId) async {
    return await (db.select(
      db.gender,
    )..where((e) => e.id.equals(genderId))).getSingleOrNull();
  }
}
