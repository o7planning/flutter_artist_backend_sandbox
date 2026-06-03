import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:msw_dio_interceptor/msw_dio_interceptor.dart';

class MockResponseUtils {
  static MockResponse handleError(dynamic error) {
    Map<String, dynamic> json;
    if (error is AppError) {
      json = {
        "errorMessage": error.errorMessage,
        "errorDetails": error.errorDetails,
      };
    } else {
      json = {"errorMessage": error.toString()};
    }
    return MockResponse.json(json, statusCode: 400);
  }
}
