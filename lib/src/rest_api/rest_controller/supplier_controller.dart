import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../database/_global_base64_image.dart';
import '../../database/joins/supplier_with_type.dart';
import '../../model/model.dart';
import '../../utils/email_checker_utils.dart';
import '../../utils/mock_response_utils.dart';
import '../form/_form_field_error.dart';
import '../form/supplier_form.dart';

// *****************************************************************************
// *****************************************************************************

void supplierRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/page/supplier-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getSupplierInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  // /rest/record/supplier-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/supplier-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final supplierId = int.parse(request.path.split('/').last);
          return await getSupplierDetail(request, supplierId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/supplier-data/update',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await updateSupplier(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/supplier-data/create',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          return await createSupplier(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/supplier/delete/\\d+',
      method: 'DELETE',
      handler: (MockRequest request) async {
        try {
          final supplierId = int.parse(request.path.split('/').last);
          return await deleteSupplier(request, supplierId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getSupplierInfoPage(MockRequest request) async {
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null,
  Map<String, dynamic> queryParameters = request.query;
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  final query = db.select(db.supplier)
    ..where((e) => e.name.containsCase(searchText));
  //

  final joinedQuery = query.join([
    innerJoin(
      db.supplierType,
      db.supplierType.id.equalsExp(db.supplier.supplierTypeId),
    ),
  ]);
  //
  final result = await joinedQuery.get();

  List<SupplierWithType> allSupplierWithType = result.map((row) {
    final supplier = row.readTable(db.supplier);
    final supplierType = row.readTable(db.supplierType);
    return SupplierWithType(supplier, supplierType);
  }).toList();
  //
  List<SupplierInfo> list = allSupplierWithType
      .map((e) => SupplierInfo.fromEntity(e.supplier, e.supplierType))
      .toList();
  //
  PageData<SupplierInfo> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: list,
  );
  SupplierInfoPage p = SupplierInfoPage(
    items: pageData.items,
    paginationInfo: PaginationInfoImpl.fromPagination(pageData.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// SupplierDetail.
Future<MockResponse> getSupplierDetail(
  MockRequest request,
  int supplierId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  SupplierData? entity = await db.supplierDAO.findById(supplierId);

  if (entity == null) {
    return MockResponse.json({});
  }

  SupplierTypeData? supplierType = await db.supplierTypeDAO.findById(
    entity.supplierTypeId,
  );

  SupplierDetail detail = SupplierDetail.fromEntity(entity, supplierType!);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> updateSupplier(MockRequest request) async {
  FormData formData = request.body;
  final SupplierForm form = SupplierForm(formData);
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  final SupplierTypeData? supplierType = await db.supplierTypeDAO.findById(
    form.supplierTypeId,
  );
  if (supplierType == null) {
    throw FormFieldError(
      errorMessage: "SupplierType ${form.supplierTypeId} not found",
    );
  }
  // May throw AppError:
  EmailCheckerUtils.checkEmail(form.email);
  //
  final SupplierData? supplierInDB = await db.supplierDAO.findByEmail(
    form.email,
  );
  if (supplierInDB != null && supplierInDB.id != form.id!) {
    throw AppError(errorMessage: "Duplicate email ${form.email}");
  }
  //
  db.update(db.supplier)
    ..where((u) => u.id.equals(form.id!))
    ..write(
      SupplierCompanion(
        name: Value(form.name),
        active: Value(form.active),
        email: Value(form.email),
        supplierTypeId: Value(form.supplierTypeId),
        address: Value(form.address),
        phone: Value(form.phone),
        description: Value(form.description),
      ),
    );
  //
  await storeSupplierBase64Image(form.id!, form.multipartFile);
  //
  final SupplierData? supplier = await db.supplierDAO.findById(form.id!);
  //
  if (supplier == null) {
    return MockResponse.json({});
  } else {
    SupplierDetail detail = SupplierDetail.fromEntity(supplier, supplierType);
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> createSupplier(MockRequest request) async {
  FormData formData = request.body;
  final SupplierForm form = SupplierForm(formData);
  final SharedDatabase db = await getSharedDatabase();
  //
  final SupplierTypeData? supplierType = await db.supplierTypeDAO.findById(
    form.supplierTypeId,
  );
  if (supplierType == null) {
    throw FormFieldError(
      errorMessage: "SupplierType ${form.supplierTypeId} not found",
    );
  }
  //
  EmailCheckerUtils.checkEmail(form.email);
  final SupplierData? supplierInDB = await db.supplierDAO.findByEmail(
    form.email,
  );
  if (supplierInDB != null) {
    throw AppError(
      errorMessage:
          "This email (${form.email}) is already in use by another Customer.",
    );
  }
  //
  final supplierId = await db
      .into(db.supplier)
      .insert(
        SupplierCompanion.insert(
          name: form.name,
          active: form.active,
          email: form.email,
          address: Value(form.address),
          phone: Value(form.phone),
          description: Value(form.description),
          supplierTypeId: form.supplierTypeId,
          imagePath: Value.absent(),
        ),
      );
  //
  await storeSupplierBase64Image(supplierId, form.multipartFile);
  //
  final SupplierData? supplier = await db.supplierDAO.findById(supplierId);
  //
  if (supplier == null) {
    return MockResponse.json({});
  } else {
    SupplierDetail detail = SupplierDetail.fromEntity(supplier, supplierType);
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> deleteSupplier(MockRequest request, int supplierId) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final SupplierData? supplier = await db.supplierDAO.findById(supplierId);
  if (supplier == null) {
    return MockResponse.json({});
  }
  //
  await db.supplierDAO.deleteById(supplierId);
  return MockResponse.json({});
}

// *****************************************************************************
// *****************************************************************************
