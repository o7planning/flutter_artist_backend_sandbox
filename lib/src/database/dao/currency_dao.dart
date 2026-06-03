part of '../../../database.dart';

@DriftAccessor(tables: [Currency])
class CurrencyDAO extends DatabaseAccessor<SharedDatabase>
    with _$CurrencyDAOMixin {
  CurrencyDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.currency)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<CurrencyData?> findById(String currencyId) async {
    return await (db.select(
      db.currency,
    )..where((e) => e.id.equals(currencyId))).getSingleOrNull();
  }
}
