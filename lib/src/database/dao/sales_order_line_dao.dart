part of '../../../database.dart';

@DriftAccessor(tables: [SalesOrderLine])
class SalesOrderLineDAO extends DatabaseAccessor<SharedDatabase>
    with _$SalesOrderLineDAOMixin {
  SalesOrderLineDAO(super.db);

  Future<SalesOrderLineData?> findById(int salesOrderLineId) async {
    return await (db.select(
      db.salesOrderLine,
    )..where((e) => e.id.equals(salesOrderLineId))).getSingleOrNull();
  }

  Future<int> deleteById(int salesOrderLineId) async {
    SalesOrderLineData? line = await findById(salesOrderLineId);
    if (line == null) {
      return 0;
    }
    int effected = await (db.delete(
      db.salesOrderLine,
    )..where((e) => e.id.equals(salesOrderLineId))).go();
    await db.salesOrderDAO.updateSalesOrderSummary(line.salesOrderId);
    return effected;
  }
}
