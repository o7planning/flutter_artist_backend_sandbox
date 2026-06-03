import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/extensions/native.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

import '../../../database.dart';
import '../../database/_global_base64_image.dart';
import '../../database/utils/drift_filter_parser.dart';
import '../../model/model.dart';
import '../../utils/mock_response_utils.dart';
import '../field_mapping/product_field_mapping.dart';
import '../form/_form_field_error.dart';
import '../form/product_form.dart';

// *****************************************************************************
// *****************************************************************************

void productRestApiRegister() {
  MockRegistry.register(
    MockRule(
      path: '/rest/features/field-based-json/page/product-info/77a',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getProductInfoPageByJSON(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  MockRegistry.register(
    MockRule(
      path: '/rest/page/product-info/search',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getProductInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );

  MockRegistry.register(
    MockRule(
      path: '/rest/page/product-info/all',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          return await getAllProductInfoPage(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );

  // /rest/record/product-data/123
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/record/product-data/\\d+',
      method: 'GET',
      handler: (MockRequest request) async {
        try {
          final productId = int.parse(request.path.split('/').last);
          return await getProductDetail(request, productId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/product-data/update',
      method: 'PUT',
      handler: (MockRequest request) async {
        try {
          return await updateProduct(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule(
      path: '/rest/record/product-data/create',
      method: 'POST',
      handler: (MockRequest request) async {
        try {
          return await createProduct(request);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
  //
  MockRegistry.register(
    MockRule.regex(
      pattern: '/rest/action/product/delete/\\d+',
      method: 'DELETE',
      handler: (MockRequest request) async {
        try {
          final productId = int.parse(request.path.split('/').last);
          return await deleteProduct(request, productId);
        } catch (e) {
          return MockResponseUtils.handleError(e);
        }
      },
    ),
  );
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getProductInfoPage(MockRequest request) async {
  // "categoryId": 1,
  // "currentPage": 1,
  // "pageSize": 20,
  // "searchText": null
  Map<String, dynamic> queryParameters = request.query;
  int? categoryId = queryParameters["categoryId"];
  int currentPage = queryParameters["currentPage"];
  int pageSize = queryParameters["pageSize"];
  String searchText = queryParameters["searchText"] ?? "";
  //
  final SharedDatabase db = await getSharedDatabase();

  final query = db.select(db.product)
    ..where((e) => e.name.containsCase(searchText));

  if (categoryId != null) {
    query.where((e) => e.categoryId.equals(categoryId));
  }
  List<ProductData> allProductDatas = await query.get();
  //
  PageData<ProductData> pageData = PageData.calculate(
    currentPage: currentPage,
    pageSize: pageSize,
    allItems: allProductDatas,
  );
  PageData<ProductInfo> page = pageData.convert(
    converter: (productData) => ProductInfo.fromEntity(productData),
  );
  ProductInfoPage p = ProductInfoPage(
    items: page.items,
    paginationInfo: PaginationInfoImpl.fromPagination(page.paginationInfo),
  );
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getAllProductInfoPage(MockRequest request) async {
  final SharedDatabase db = await getSharedDatabase();

  final query = db.select(db.product);

  List<ProductData> allProductDatas = await query.get();
  //
  PageData<ProductData> pageData = PageData.calculate(
    currentPage: 1,
    pageSize: -1,
    allItems: allProductDatas,
  );
  PageData<ProductInfo> page = pageData.convert(
    converter: (productData) => ProductInfo.fromEntity(productData),
  );
  ProductInfoPage p = ProductInfoPage(items: page.items, paginationInfo: null);
  return MockResponse.json(p.toJson());
}

// *****************************************************************************
// *****************************************************************************

// ProductDetail.
Future<MockResponse> getProductDetail(
  MockRequest request,
  int productId,
) async {
  final SharedDatabase db = await getSharedDatabase();

  ProductData? product = await db.productDAO.findById(productId);

  if (product == null) {
    return MockResponse.json({});
  }
  int categoryId = product.categoryId;
  CategoryData category = await (db.select(
    db.category,
  )..where((e) => e.id.equals(categoryId))).getSingle();

  ProductDetail detail = ProductDetail.fromEntity(product, category);
  return MockResponse.json(detail.toJson());
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> updateProduct(MockRequest request) async {
  FormData formData = request.body;
  final ProductForm form = ProductForm(formData);
  if (form.id == null) {
    throw FormFieldError(errorMessage: "No id to update");
  }
  final SharedDatabase db = await getSharedDatabase();
  //
  final CategoryData? category = await db.categoryDAO.findById(form.categoryId);
  if (category == null) {
    throw FormFieldError(errorMessage: "Category ${form.categoryId} not found");
  }
  //
  await db.update(db.product)
    ..where((u) => u.id.equals(form.id!))
    ..write(
      ProductCompanion(
        name: Value(form.name),
        price: Value(form.price),
        active: Value(form.active),
        categoryId: Value(form.categoryId),
        estimatedInputPrice: Value(form.estimatedInputPrice),
        taxRate: Value(form.taxRate),
        description: Value(form.description),
        // imagePath :Value(form.),
      ),
    );
  //
  await storeProductBase64Image(form.id!, form.multipartFile);
  //
  final ProductData? product = await db.productDAO.findById(form.id!);
  //
  if (product == null) {
    return MockResponse.json({});
  } else {
    ProductDetail detail = ProductDetail.fromEntity(product, category);
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> createProduct(MockRequest request) async {
  FormData formData = request.body;
  final ProductForm form = ProductForm(formData);
  final SharedDatabase db = await getSharedDatabase();
  //
  final CategoryData? category = await db.categoryDAO.findById(form.categoryId);
  if (category == null) {
    throw FormFieldError(errorMessage: "Category ${form.categoryId} not found");
  }
  //
  final productId = await db
      .into(db.product)
      .insert(
        ProductCompanion.insert(
          name: form.name,
          price: form.price,
          active: form.active,
          categoryId: form.categoryId,
          estimatedInputPrice: form.estimatedInputPrice,
          taxRate: form.taxRate,
          description: Value.absentIfNull(form.description),
          // imagePath: Value.absent(),
        ),
      );
  //
  await storeProductBase64Image(productId, form.multipartFile);
  //
  final ProductData? product = await db.productDAO.findById(productId);
  //
  if (product == null) {
    return MockResponse.json({});
  } else {
    ProductDetail detail = ProductDetail.fromEntity(product, category);
    return MockResponse.json(detail.toJson());
  }
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> deleteProduct(MockRequest request, int productId) async {
  final SharedDatabase db = await getSharedDatabase();
  //
  final ProductData? product = await db.productDAO.findById(productId);
  if (product == null) {
    return MockResponse.json({});
  }
  //
  await db.productDAO.deleteById(productId);
  return MockResponse.json({});
}

// *****************************************************************************
// *****************************************************************************

Future<MockResponse> getProductInfoPageByJSON(MockRequest request) async {
  try {
    Map<String, dynamic> queryParameters = request.query;
    int currentPage =
        int.tryParse(queryParameters["currentPage"]?.toString() ?? '1') ?? 1;
    int pageSize =
        int.tryParse(queryParameters["pageSize"]?.toString() ?? '10') ?? 10;

    // 1. Decode JSON from request
    String fieldBasedJSONRaw = queryParameters["fieldBasedJSON"] ?? "{}";
    Map<String, dynamic> filterMap = jsonDecode(fieldBasedJSONRaw);

    final SharedDatabase db = await getSharedDatabase();

    // 2. Initialize Parser and pass the specific product mapping
    final parser = DriftFilterParser(db);
    final whereExpression = parser.parse(
      filterMap,
      ProductFieldMapping.fieldToColumnMap(db),
    );

    // 3. Build Query with Join
    final query = db.select(db.product).join([
      innerJoin(db.category, db.category.id.equalsExp(db.product.categoryId)),
    ]);

    // 4. Inject the dynamic WHERE clause
    query.where(whereExpression);

    // 5. Execution
    final rows = await query.get();

    // 6. Map to ProductInfo models
    List<ProductInfo> allItems = rows.map((row) {
      final product = row.readTable(db.product);
      final category = row.readTable(db.category);

      // Use your factory logic
      return ProductInfo.fromEntity(product);
    }).toList();

    // 7. Local Pagination logic
    PageData<ProductInfo> pageData = PageData.calculate(
      currentPage: currentPage,
      pageSize: pageSize,
      allItems: allItems,
    );

    ProductInfoPage responsePage = ProductInfoPage(
      items: pageData.items,
      paginationInfo: PaginationInfoImpl.fromPagination(
        pageData.paginationInfo,
      ),
    );

    return MockResponse.json(responsePage.toJson());
  } catch (e) {
    return MockResponseUtils.handleError(e);
  }
}
