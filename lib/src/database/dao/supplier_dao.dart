part of '../../../database.dart';

@DriftAccessor(tables: [Supplier])
class SupplierDAO extends DatabaseAccessor<SharedDatabase>
    with _$SupplierDAOMixin {
  SupplierDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.supplier)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<SupplierData?> findById(int supplierId) async {
    return await (db.select(
      db.supplier,
    )..where((e) => e.id.equals(supplierId))).getSingleOrNull();
  }

  Future<SupplierData?> findByEmail(String email) async {
    return await (db.select(
      db.supplier,
    )..where((e) => e.email.equals(email))).getSingleOrNull();
  }

  Future<int> deleteById(int supplierId) async {
    return await (db.delete(
      db.supplier,
    )..where((e) => e.id.equals(supplierId))).go();
  }
}
