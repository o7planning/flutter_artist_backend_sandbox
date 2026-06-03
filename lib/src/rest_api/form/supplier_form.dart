import 'package:dio/dio.dart';

import '_form_base.dart';

// "supplierTypeId": 1,
// "id": 1,
// "name": "Johnson & Johnson",
// "email": "medinfocenter@its.jnj.com",
// "address": null,
// "phone": null,
// "active": true,
// "description": null,
// "xFiles": null
class SupplierForm extends FormBase {
  late int? id;
  late int supplierTypeId;
  late String name;
  late String email;
  late String? address;
  late String? phone;
  late bool active;
  late String? description;
  late MultipartFile? multipartFile;

  SupplierForm(super.formData) {
    id = getIntNullableValue("id");
    supplierTypeId = getIntValue("supplierTypeId");
    name = getStringValue("name");
    email = getStringValue("email");
    address = getStringNullableValue("address");
    phone = getStringNullableValue("phone");
    description = getStringNullableValue("description");
    active = getBoolNullableValue("active") ?? false;
    multipartFile = getFile("multipartFile");
  }
}
