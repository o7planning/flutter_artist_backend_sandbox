part of '../../../database.dart';

@DriftAccessor(tables: [Language])
class LanguageDAO extends DatabaseAccessor<SharedDatabase>
    with _$LanguageDAOMixin {
  LanguageDAO(super.db);

  Future<LanguageData?> findById(String languageId) async {
    return await (db.select(
      db.language,
    )..where((e) => e.id.equals(languageId))).getSingleOrNull();
  }
}
