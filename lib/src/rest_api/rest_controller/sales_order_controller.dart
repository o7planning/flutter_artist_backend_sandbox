import 'dart:math';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/date_utils.dart';
import '../../utils/mock_response_utils.dart';
import '../form/_form_field_error.dart';
import '../form/sales_order_form.dart';

// *****************************************************************************
// *****************************************************************************

void salesOrderRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/sales-order-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getSalesOrderInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/sales-order-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/sales-order-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final salesOrderId = int.parse(request.path.split('/').last);
          return await getSalesOrderDetail(request, salesOrderId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );

  // /rest/record/sales-order-data/update
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/sales-order-data/update',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await updateSalesOrder(request);
        } catch (e, stackTrace) {
          print("ERROR: $stackTrace");
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/sales-order-data/create
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/sales-order-data/create',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          return await createSalesOrder(request);
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

Future<MockResponse> getSalesOrderInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<SalesOrderData> allSalesOrderDatas = await (db.select(
    db.salesOrder,
  )).get();
  //
  PageData<SalesOrderData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allSalesOrderDatas,
  );
  PageData<SalesOrderInfo> page = pageData.convert(
    converter: (salesOrderData) => SalesOrderInfo.fromEntity(salesOrderData),
  );
  SalesOrderInfoPage p = SalesOrderInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// SalesOrderDetail.
Future<MockResponse> getSalesOrderDetail(
  MockRequest request,
  int salesOrderId,
) async {
  final SharedDatabase db = await getSharedDatabase();
  SalesOrderData? entity = await db.salesOrderDAO.findById(salesOrderId);

  if (entity == null) {
    return MockResponse.json({});
  }
  EmployeeData? employee = await db.employeeDAO.findById(entity.sellerId);
  EmployeePositionData? position;
  if (employee != null) {
    position = await db.employeePositionDAO.findById(
      employee.employeePositionId,
    );
  }
  CustomerData? customer = await db.customerDAO.findById(entity.customerId);

  SalesOrderDetail detail = SalesOrderDetail.fromEntity(
    entity,
    employee,
    position,
    customer,
  );
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> updateSalesOrder(MockRequest request) async {
  FormData formData = request.body;
  final SalesOrderForm form = SalesOrderForm(formData);
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  final CustomerData? customer = await db.customerDAO.findById(
    form.customerId!,
  );
  if (customer == null) {
    throw FormFieldError(errorMessage: "Customer ${form.customerId} not found");
  }
  //
  db.update(db.salesOrder)
    ..where((u) => u.id.equals(form.id!))
    ..write(
      SalesOrderCompanion(
        customerId: Value(form.customerId!),
        sellerId: Value.absentIfNull(form.employeeId),
        orderDateTime: Value.absentIfNull(
          form.orderDateTime == null
              ? null
              : stringToDateTime(form.orderDateTime),
        ),
      ),
    );
  // Recalculate SalesOrder.
  await db.salesOrderDAO.updateSalesOrderSummary(form.id!);
  //
  final SalesOrderData? salesOrder = await db.salesOrderDAO.findById(form.id!);
  //
  if (salesOrder == null) {
    return MockResponse.json({});
  } else {
    final EmployeeData employee = (await db.employeeDAO.findById(
      salesOrder.sellerId,
    ))!;
    final EmployeePositionData position = (await db.employeePositionDAO
        .findById(employee.employeePositionId))!;
    SalesOrderDetail detail = SalesOrderDetail.fromEntity(
      salesOrder,
      employee,
      position,
      customer,
    );
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> createSalesOrder(MockRequest request) async {
  FormData formData = request.body;
  final SalesOrderForm form = SalesOrderForm(formData);
  final SharedDatabase db = await getSharedDatabase();
  //
  final CustomerData? customer = await db.customerDAO.findById(
    form.customerId!,
  );
  if (customer == null) {
    throw FormFieldError(errorMessage: "Customer ${form.customerId} not found");
  }
  EmployeeData? employee = form.employeeId == null
      ? null
      : await db.employeeDAO.findById(form.employeeId!);

  final list = await db.employeeDAO.getAll();
  employee ??= list[Random().nextInt(list.length)];

  final EmployeePositionData? position = await db.employeePositionDAO.findById(
    employee.employeePositionId,
  );
  //
  final salesOrderId = await db
      .into(db.salesOrder)
      .insert(
        SalesOrderCompanion.insert(
          orderDateTime: stringToDateTime(form.orderDateTime),
          status: "PENDING",
          sellerId: employee.id,
          customerId: customer.id,
          amount: 0,
          taxAmount: 0,
        ),
      );
  //
  final SalesOrderData? salesOrder = await db.salesOrderDAO.findById(
    salesOrderId,
  );
  //
  if (salesOrder == null) {
    return MockResponse.json({});
  } else {
    SalesOrderDetail detail = SalesOrderDetail.fromEntity(
      salesOrder,
      employee,
      position,
      customer,
    );
    return MockResponse.json(detail.toJson());
  }
}
