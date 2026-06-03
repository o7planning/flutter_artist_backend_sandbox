part of '../../../database.dart';

@DriftAccessor(tables: [SupplierType])
class SupplierTypeDAO extends DatabaseAccessor<SharedDatabase>
    with _$SupplierTypeDAOMixin {
  SupplierTypeDAO(super.db);

  Future<SupplierTypeData?> findById(int supplierTypeId) async {
    return await (db.select(
      db.supplierType,
    )..where((e) => e.id.equals(supplierTypeId))).getSingleOrNull();
  }
}
