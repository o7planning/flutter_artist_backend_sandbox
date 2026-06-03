import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../database/joins/sales_order_line_with_other_product.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';
import '../form/_form_field_error.dart';
import '../form/sales_order_line_form.dart';

// *****************************************************************************
// *****************************************************************************

void salesOrderLineRestApiRegister() {
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/page/sales-order-line-info/all/by-sales-order-id/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final salesOrderId = int.parse(request.path.split('/').last);
          return await getAllSalesOrderLineInfoPage(request, salesOrderId);
        } catch (e, stackTrace) {
          print("ERROR: $stackTrace");
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/sales-order-line-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/sales-order-line-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final salesOrderLineId = int.parse(request.path.split('/').last);
          return await getSalesOrderLineDetail(request, salesOrderLineId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/sales-order-line-data/update
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/sales-order-line-data/update',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await updateSalesOrderLine(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/action/sales-order-line/delete/2
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/sales-order-line/delete/\\d+',
      method: 'DELETE',
      handler: (MockRequest request) async {
        try {
          final salesOrderLineId = int.parse(request.path.split('/').last);
          return await deleteSalesOrderLine(request, salesOrderLineId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/sales-order-line-data/create
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/sales-order-line-data/create',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          return await createSalesOrderLine(request);
        } catch (e, stackTrace) {
          print("ERROR: $stackTrace");
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getAllSalesOrderLineInfoPage(
  MockRequest request,
  int salesOrderId,
) async {
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = 1;
  int pageSize = -1;
  //
  final SharedDatabase db = await getSharedDatabase();

  final select = db.select(db.salesOrderLine);

  final joinedQuery = select.join([
    innerJoin(
      db.salesOrder,
      db.salesOrder.id.equals(salesOrderId) &
          db.salesOrder.id.equalsExp(db.salesOrderLine.salesOrderId),
    ),
    innerJoin(db.product, db.product.id.equalsExp(db.salesOrderLine.productId)),
  ]);
  //
  final result = await joinedQuery.get();

  List<SalesOrderLineWithProduct> allItems = result.map((row) {
    final salesOrderLine = row.readTable(db.salesOrderLine);
    final product = row.readTable(db.product);
    //
    return SalesOrderLineWithProduct(salesOrderLine, product);
  }).toList();

  print("###: allItems: $allItems");

  PageData<SalesOrderLineWithProduct> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allItems,
  );
  PageData<SalesOrderLineInfo> page = pageData.convert(
    converter: (SalesOrderLineWithProduct salesOrderLineWithProduct) {
      return SalesOrderLineInfo.fromEntity(
        salesOrderLineWithProduct.salesOrderLine,
        salesOrderLineWithProduct.product,
      );
    },
  );
  SalesOrderLineInfoPage p = SalesOrderLineInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getSalesOrderLineDetail(
  MockRequest request,
  int salesOrderLineId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  SalesOrderLineData? entity = await db.salesOrderLineDAO.findById(
    salesOrderLineId,
  );

  if (entity == null) {
    return MockResponse.json({});
  }
  ProductData product = await (db.select(
    db.product,
  )..where((e) => e.id.equals(entity.productId))).getSingle();
  //
  SalesOrderLineDetail detail = SalesOrderLineDetail.fromEntity(
    entity,
    product,
  );
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> updateSalesOrderLine(MockRequest request) async {
  FormData formData = request.body;
  final SalesOrderLineForm form = SalesOrderLineForm(formData);
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  final ProductData? product = await db.productDAO.findById(form.productId);
  if (product == null) {
    throw FormFieldError(errorMessage: "Product ${form.productId} not found");
  }
  //
  final SalesOrderData? salesOrder = await db.salesOrderDAO.findById(
    form.salesOrderId,
  );
  if (salesOrder == null) {
    throw FormFieldError(
      errorMessage: "SalesOrder ${form.salesOrderId} not found",
    );
  }
  //
  db.update(db.salesOrderLine)
    ..where((u) => u.id.equals(form.id!))
    ..write(
      SalesOrderLineCompanion(
        salesOrderId: Value(form.salesOrderId),
        productId: Value(form.productId),
        units: Value(form.units),
        amount: Value(form.units * product.price),
        taxAmount: Value(form.units * product.price * product.taxRate),
      ),
    );
  // Recalculate SalesOrder.
  await db.salesOrderDAO.updateSalesOrderSummary(form.salesOrderId);
  //
  final SalesOrderLineData? salesOrderLine = await db.salesOrderLineDAO
      .findById(form.id!);
  //
  if (salesOrderLine == null) {
    return MockResponse.json({});
  } else {
    SalesOrderLineDetail detail = SalesOrderLineDetail.fromEntity(
      salesOrderLine,
      product,
    );
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> createSalesOrderLine(MockRequest request) async {
  FormData formData = request.body;
  final SalesOrderLineForm form = SalesOrderLineForm(formData);
  final SharedDatabase db = await getSharedDatabase();
  //
  final ProductData? product = await db.productDAO.findById(form.productId);
  if (product == null) {
    throw FormFieldError(errorMessage: "Product ${form.productId} not found");
  }
  //
  final SalesOrderData? salesOrder = await db.salesOrderDAO.findById(
    form.salesOrderId,
  );
  if (salesOrder == null) {
    throw FormFieldError(
      errorMessage: "SalesOrder ${form.salesOrderId} not found",
    );
  }
  //
  final salesOrderLineId = await db
      .into(db.salesOrderLine)
      .insert(
        SalesOrderLineCompanion.insert(
          salesOrderId: form.salesOrderId,
          productId: form.productId,
          units: form.units,
          amount: form.units * product.price,
          taxAmount: form.units * product.price * product.taxRate,
        ),
      );
  // Recalculate SalesOrder.
  await db.salesOrderDAO.updateSalesOrderSummary(form.salesOrderId);
  //
  final SalesOrderLineData? salesOrderLine = await db.salesOrderLineDAO
      .findById(salesOrderLineId);
  //
  if (salesOrderLine == null) {
    return MockResponse.json({});
  } else {
    SalesOrderLineDetail detail = SalesOrderLineDetail.fromEntity(
      salesOrderLine,
      product,
    );
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> deleteSalesOrderLine(
  MockRequest request,
  int salesOrderLineId,
) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final SalesOrderLineData? salesOrderLine = await db.salesOrderLineDAO
      .findById(salesOrderLineId);
  if (salesOrderLine == null) {
    return MockResponse.json({});
  }
  //
  await db.salesOrderLineDAO.deleteById(salesOrderLineId);
  return MockResponse.json({});
}
