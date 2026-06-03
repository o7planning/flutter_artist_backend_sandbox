import 'package:dio/dio.dart';

import '../utils/form_data_utils.dart';

final Map<int, String> supplierBase64ImageMap = {};
final Map<int, String> employeeBase64ImageMap = {};
final Map<int, String> productBase64ImageMap = {};
final Map<int, String> footballPlayerBase64ImageMap = {};

// *****************************************************************************

Future<void> storeSupplierBase64Image(
  int supplierId,
  MultipartFile? multipartFile,
) async {
  String? base64Image = await FormDataUtils.convertMultipartFileToBase64Url(
    multipartFile,
  );
  if (base64Image != null) {
    supplierBase64ImageMap[supplierId] = base64Image;
  }
}

String? getSupplierBase64Image(int supplierId) {
  return supplierBase64ImageMap[supplierId];
}

// *****************************************************************************

Future<void> storeEmployeeBase64Image(
  int employeeId,
  MultipartFile? multipartFile,
) async {
  String? base64Image = await FormDataUtils.convertMultipartFileToBase64Url(
    multipartFile,
  );
  if (base64Image != null) {
    employeeBase64ImageMap[employeeId] = base64Image;
  }
}

String? getEmployeeBase64Image(int employeeId) {
  return employeeBase64ImageMap[employeeId];
}

// *****************************************************************************

Future<void> storeFootballPlayerBase64Image(
  int footballPlayerId,
  MultipartFile? multipartFile,
) async {
  String? base64Image = await FormDataUtils.convertMultipartFileToBase64Url(
    multipartFile,
  );
  if (base64Image != null) {
    footballPlayerBase64ImageMap[footballPlayerId] = base64Image;
  }
}

String? getFootballPlayerBase64Image(int footballPlayerId) {
  return footballPlayerBase64ImageMap[footballPlayerId];
}

// *****************************************************************************

Future<void> storeProductBase64Image(
  int productId,
  MultipartFile? multipartFile,
) async {
  String? base64Image = await FormDataUtils.convertMultipartFileToBase64Url(
    multipartFile,
  );
  if (base64Image != null) {
    productBase64ImageMap[productId] = base64Image;
  }
}

String? getProductBase64Image(int productId) {
  return productBase64ImageMap[productId];
}

// *****************************************************************************
