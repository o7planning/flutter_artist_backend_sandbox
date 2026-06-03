import 'package:flutter_artist_core/flutter_artist_core.dart';

class EmailCheckerUtils {
  static void checkEmail(String email) {
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
    if (!emailValid) {
      throw AppError(errorMessage: "Email '$email' is not valid");
    }
  }
}
