import 'package:dio/dio.dart';

import '_form_base.dart';

// "id": 1,
// "categoryId": 1,
// "name": "333 Beer",
// "price": 1,
// "estimatedInputPrice": 0.8,
// "taxRate": 0.1,
// "active": false,
// "description": null,
// "xFiles": null
class ProductForm extends FormBase {
  late int? id;
  late int categoryId;
  late String name;
  late double price;
  late double estimatedInputPrice;
  late double taxRate;
  late bool active;
  late String? description;
  late MultipartFile? multipartFile;

  ProductForm(super.formData) {
    id = getIntNullableValue("id");
    categoryId = getIntValue("categoryId");
    name = getStringValue("name");
    price = getDoubleValue("price");
    estimatedInputPrice = getDoubleValue("estimatedInputPrice");
    taxRate = getDoubleValue("taxRate");
    active = getBoolNullableValue("active") ?? false;
    description = getStringNullableValue("description");
    multipartFile = getFile("multipartFile");
  }
}
