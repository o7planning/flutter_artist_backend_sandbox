part of '../../../database.dart';

@DriftAccessor(tables: [University])
class UniversityDAO extends DatabaseAccessor<SharedDatabase>
    with _$UniversityDAOMixin {
  UniversityDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.university)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<UniversityData?> findById(int universityId) async {
    return await (db.select(
      db.university,
    )..where((e) => e.id.equals(universityId))).getSingleOrNull();
  }

  Future<UniversityData?> findByCode(String code) async {
    return await (db.select(
      db.university,
    )..where((e) => e.code.equals(code))).getSingleOrNull();
  }
}
