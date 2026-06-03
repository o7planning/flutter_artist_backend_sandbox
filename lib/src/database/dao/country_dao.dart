part of '../../../database.dart';

@DriftAccessor(tables: [Country])
class CountryDAO extends DatabaseAccessor<SharedDatabase>
    with _$CountryDAOMixin {
  CountryDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.country)..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<CountryData?> findById(String countryId) async {
    return await (db.select(
      db.country,
    )..where((e) => e.id.equals(countryId))).getSingleOrNull();
  }
}
