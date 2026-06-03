part of '../../../database.dart';

@DriftAccessor(tables: [SalesOrderLine, SalesOrder, Product, Category])
class BestSellingDAO extends DatabaseAccessor<SharedDatabase>
    with _$BestSellingDAOMixin {
  BestSellingDAO(super.db);

  Future<List<BestSellingDetail>> getBestSellings(int days) {
    final categoryId = db.category.id;
    final categoryName = db.category.name;
    final productId = db.product.id;
    final productName = db.product.name;
    final productImagePath = db.product.imagePath;
    final unitsTotal = db.salesOrderLine.units.sum();
    final amountTotal = db.salesOrderLine.amount.sum();
    final taxAmountTotal = db.salesOrderLine.taxAmount.sum();

    // Use a select statement with a join clause.
    final join = (select(db.salesOrderLine).join([
      innerJoin(
        db.salesOrder,
        db.salesOrder.id.equalsExp(db.salesOrderLine.salesOrderId),
      ),
      innerJoin(
        db.product,
        db.product.id.equalsExp(db.salesOrderLine.productId),
      ),
      innerJoin(db.category, db.category.id.equalsExp(db.product.categoryId)),
    ])..addColumns([unitsTotal, amountTotal, taxAmountTotal]));
    //
    // Group.
    //
    join
      ..groupBy([
        categoryId,
        categoryName,
        productId,
        productName,
        productImagePath,
      ])
      ..orderBy([
        OrderingTerm(expression: unitsTotal, mode: OrderingMode.desc),
        OrderingTerm(expression: amountTotal, mode: OrderingMode.desc),
        OrderingTerm(expression: taxAmountTotal, mode: OrderingMode.desc),
      ]);
    //
    return join.map((row) {
      return BestSellingDetail.named(
        categoryId: row.read(categoryId)!,
        categoryName: row.read(categoryName)!,
        productId: row.read(productId)!,
        productName: row.read(productName)!,
        productImagePath: row.read(productImagePath),
        unitsTotal: row.read(unitsTotal) ?? 0.0,
        amountTotal: row.read(amountTotal) ?? 0.0,
        taxAmountTotal: row.read(taxAmountTotal) ?? 0.0,
      );
    }).get();
  }
}
