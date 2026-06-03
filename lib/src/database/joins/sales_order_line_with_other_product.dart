import '../../../database.dart';

class SalesOrderLineWithProduct {
  final SalesOrderLineData salesOrderLine;
  final ProductData product;

  SalesOrderLineWithProduct(this.salesOrderLine, this.product);
}
