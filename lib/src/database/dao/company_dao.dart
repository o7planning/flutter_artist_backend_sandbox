part of '../../../database.dart';

@DriftAccessor(tables: [Company])
class CompanyDAO extends DatabaseAccessor<SharedDatabase>
    with _$CompanyDAOMixin {
  CompanyDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.company)..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<CompanyData?> findById(int companyId) async {
    return await (db.select(
      db.company,
    )..where((e) => e.id.equals(companyId))).getSingleOrNull();
  }

  Future<CompanyData?> findByCode(String code) async {
    return await (db.select(
      db.company,
    )..where((e) => e.code.equals(code))).getSingleOrNull();
  }
}
