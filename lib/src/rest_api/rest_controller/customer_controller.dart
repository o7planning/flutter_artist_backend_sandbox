import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';
import '../form/_form_field_error.dart';
import '../form/customer_quick_update_code_form.dart';
import '../form/customer_quick_update_vip_form.dart';

// *****************************************************************************
// *****************************************************************************

void customerRestApiRegister() {
  // /rest/page/customer-info/all
  MockRegistry.register(
    MockRule(
      path: '/rest/page/customer-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getAllCustomerInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/page/customer-info/search
  MockRegistry.register(
    MockRule(
      path: '/rest/page/customer-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getCustomerInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/customer-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/customer-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final customerId = int.parse(request.path.split('/').last);
          return await getCustomerDetail(request, customerId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/customer-data/update-code',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await quickUpdateCustomerCode(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/customer-data/update-vip',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await quickUpdateCustomerVip(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getAllCustomerInfoPage(MockRequest request) async {
  int currentPage = 1;
  int pageSize = -1;
  //
  final SharedDatabase db = await getSharedDatabase();

  List<CustomerData> allCustomerDatas = await (db.select(db.customer)).get();
  //
  PageData<CustomerData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allCustomerDatas,
  );
  PageData<CustomerInfo> page = pageData.convert(
    converter: (customerData) => CustomerInfo.fromEntity(customerData),
  );
  CustomerInfoPage p = CustomerInfoPage(
    items: page.items,
    paginationInfo: null,
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getCustomerInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  List<CustomerData> allCustomerDatas = await (db.select(
    db.customer,
  )..where((e) => e.name.containsCase(searchText))).get();
  //
  PageData<CustomerData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allCustomerDatas,
  );
  PageData<CustomerInfo> page = pageData.convert(
    converter: (customerData) => CustomerInfo.fromEntity(customerData),
  );
  CustomerInfoPage p = CustomerInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );

  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// CustomerDetail.
Future<MockResponse> getCustomerDetail(
  MockRequest request,
  int customerId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  CustomerData? entity = await db.customerDAO.findById(customerId);

  if (entity == null) {
    return MockResponse.json({});
  }
  CustomerDetail detail = CustomerDetail.fromEntity(entity);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> quickUpdateCustomerCode(MockRequest request) async {
  FormData formData = request.body;
  final CustomerQuickUpdateCodeForm form = CustomerQuickUpdateCodeForm(
    formData,
  );
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  CustomerData? customerInDB = await db.customerDAO.findByCode(form.code);
  if (customerInDB != null && customerInDB.id != form.id) {
    throw AppError(errorMessage: "Duplicate code ${form.code}");
  }
  //
  await db.update(db.customer)
    ..where((u) => u.id.equals(form.id!))
    ..write(CustomerCompanion(code: Value(form.code)));
  //
  final CustomerData? customer = await db.customerDAO.findById(form.id!);
  //
  if (customer == null) {
    return MockResponse.json({});
  } else {
    CustomerDetail detail = CustomerDetail.fromEntity(customer);
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> quickUpdateCustomerVip(MockRequest request) async {
  FormData formData = request.body;
  final CustomerQuickUpdateVipForm form = CustomerQuickUpdateVipForm(formData);
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  await db.update(db.customer)
    ..where((u) => u.id.equals(form.id!))
    ..write(CustomerCompanion(vip: Value(form.vip)));
  //
  final CustomerData? customer = await db.customerDAO.findById(form.id!);
  //
  if (customer == null) {
    return MockResponse.json({});
  } else {
    CustomerDetail detail = CustomerDetail.fromEntity(customer);
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************
