part of '../../../database.dart';

@DriftAccessor(tables: [SalesOrder])
class SalesOrderDAO extends DatabaseAccessor<SharedDatabase>
    with _$SalesOrderDAOMixin {
  SalesOrderDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.salesOrder)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<SalesOrderData?> findById(int salesOrderId) async {
    return await (db.select(
      db.salesOrder,
    )..where((e) => e.id.equals(salesOrderId))).getSingleOrNull();
  }

  Future<void> updateSalesOrderSummary(int salesOrderId) async {
    List<SalesOrderLineData> lines = await (db.select(
      db.salesOrderLine,
    )..where((e) => e.salesOrderId.equals(salesOrderId))).get();
    double amount = 0;
    double taxAmount = 0;
    for (var line in lines) {
      amount += line.amount;
      taxAmount += line.taxAmount;
    }
    print("Update SalesOrder: Amount: $amount");

    db.update(db.salesOrder)
      ..where((u) => u.id.equals(salesOrderId))
      ..write(
        SalesOrderCompanion(amount: Value(amount), taxAmount: Value(taxAmount)),
      );
  }
}
