import 'package:flutter/services.dart' show rootBundle;

class AssetsUtils {
  static Future<String> loadTextAsset(String path) async {
    return await rootBundle.loadString(
      "packages/flutter_artist_backend_sandbox/$path",
    );
  }
}
