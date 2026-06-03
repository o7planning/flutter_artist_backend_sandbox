import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class FormDataUtils {
  static String? getString(FormData formData, String fieldName) {
    for (MapEntry<String, String> entry in formData.fields) {
      if (entry.key == fieldName) {
        return entry.value;
      }
    }
    return null;
  }

  static int? getInt(FormData formData, String fieldName) {
    String? value = getString(formData, fieldName);
    if (value == null) {
      return null;
    }
    return int.parse(value);
  }

  static double? getDouble(FormData formData, String fieldName) {
    String? value = getString(formData, fieldName);
    if (value == null) {
      return null;
    }
    return double.parse(value);
  }

  static Future<String> convertStreamUint8ListToBase64Url(
    Stream<Uint8List> stream,
  ) async {
    List<int> bytes = await convertStreamUint8ListToListInt(stream);
    return convertImageFileToBase64Url(bytes);
  }

  static Future<List<int>> convertStreamUint8ListToListInt(
    Stream<Uint8List> stream,
  ) async {
    final BytesBuilder bytesBuilder =
        BytesBuilder(); // Efficiently builds a list of bytes

    await for (final Uint8List chunk in stream) {
      bytesBuilder.add(chunk); // Add each Uint8List chunk to the builder
    }

    // Convert the accumulated bytes into a single Uint8List and then to List<int>
    return bytesBuilder.toBytes().toList();
  }

  static Future<List<int>> convertMultipartFileToListInt(
    MultipartFile multipartFile,
  ) async {
    Stream<Uint8List> stream = multipartFile.finalize();
    return await convertStreamUint8ListToListInt(stream);
  }

  static Future<String?> convertMultipartFileToBase64Url(
    MultipartFile? multipartFile,
  ) async {
    if (multipartFile == null) {
      return null;
    }
    Stream<Uint8List> stream = multipartFile.finalize();
    return await convertStreamUint8ListToBase64Url(stream);
  }

  static String convertImageFileToBase64Url(List<int> imageBytes) {
    String base64Image = base64Encode(imageBytes);
    return 'data:image/png;base64,$base64Image';
  }
}
