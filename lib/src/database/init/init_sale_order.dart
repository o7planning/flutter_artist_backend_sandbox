part of '../../../database.dart';

Future<void> initSaleOrders(SharedDatabase database) async {
  List<ProductData> products = await database.select(database.product).get();
  List<EmployeeData> sellers = await database.select(database.employee).get();
  List<CustomerData> customers = await database.select(database.customer).get();

  //
  DateTime now = DateTime.now();
  final int MAX = 300;
  for (int j = 0; j < MAX; j++) {
    CustomerData customer = customers[Random().nextInt(customers.length)];
    EmployeeData seller = sellers[Random().nextInt(sellers.length)];

    double amount = 0.0;
    double taxAmount = 0.0;
    //
    DateTime orderDateTime = (j < 30)
        ? now.add(-Duration(days: Random().nextInt(10)))
        : now.add(-Duration(days: Random().nextInt(200)));
    //

    String sosEnum = "DELIVERED";

    if (truncDateTime(now) == truncDateTime(orderDateTime)) {
      List<String> ss = ["PENDING", "PROCESSING"];
      sosEnum = ss[Random().nextInt(ss.length)];
    }

    int salesOrderId = await database
        .into(database.salesOrder)
        .insert(
          SalesOrderCompanion.insert(
            orderDateTime: orderDateTime,
            amount: amount,
            taxAmount: taxAmount,
            status: sosEnum,
            sellerId: seller.id,
            customerId: customer.id,
          ),
        );

    int lineCount = Random().nextInt(2) + 4;

    double salesOrderAmount = 0;
    double salesOrderTaxAmount = 0;
    double salesOrderEstimatedInputAmount = 0;
    for (int i = 0; i < lineCount; i++) {
      ProductData product = products[Random().nextInt(products.length)];
      //
      double price = product.price;
      double taxRate = product.taxRate;
      double units = Random().nextInt(10) + 1.0;
      double amount = price * units;
      double estimatedInputPrice = product.estimatedInputPrice;
      double taxAmount = taxRate * amount;
      double estimatedInputAmount = estimatedInputPrice * units;
      //
      await database
          .into(database.salesOrderLine)
          .insert(
            SalesOrderLineCompanion.insert(
              salesOrderId: salesOrderId,
              productId: product.id,
              units: units,
              amount: amount,
              taxAmount: taxAmount,
            ),
          );
      //
      salesOrderAmount += amount;
      salesOrderTaxAmount += taxAmount;
      salesOrderEstimatedInputAmount += estimatedInputAmount;
    }
    SalesOrderData? saleOrder = await database.salesOrderDAO.findById(
      salesOrderId,
    );
    //
    if (saleOrder != null) {
      SalesOrderData copy = saleOrder.copyWith(
        amount: salesOrderAmount,
        taxAmount: salesOrderTaxAmount,
      );
      database.update(database.salesOrder).replace(copy);
    }
  }
}
