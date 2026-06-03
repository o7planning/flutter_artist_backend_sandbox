import 'package:dio/dio.dart';

import '../../utils/date_utils.dart';
import '_form_field_error.dart';

class FormBase {
  final FormData formData;

  FormBase(this.formData);

  MultipartFile? getFile(String propName) {
    for (MapEntry<String, MultipartFile> entry in formData.files) {
      if (entry.key == propName) {
        return entry.value;
      }
    }
    return null;
  }

  String? getValue(String propName) {
    for (MapEntry<String, String> entry in formData.fields) {
      if (entry.key == propName) {
        return entry.value;
      }
    }
    return null;
  }

  DateTime? getDateNullableValue(String propName) {
    String? v = getValue(propName);
    if (v == null) {
      return null;
    }
    try {
      return stringToDate(v);
    } catch (e) {
      throw FormFieldError(errorMessage: "($propName) '$v' is in valid date.");
    }
  }

  DateTime getDateValue(String propName) {
    DateTime? date = getDateNullableValue(propName);
    if (date == null) {
      throw FormFieldError(errorMessage: "'$propName' must be not null.");
    }
    return date;
  }

  DateTime? getDateTimeNullableValue(String propName) {
    String? v = getValue(propName);
    if (v == null) {
      return null;
    }
    try {
      return stringToDateTime(v);
    } catch (e) {
      throw FormFieldError(
        errorMessage: "($propName) '$v' is in valid date time.",
      );
    }
  }

  DateTime getDateTimeValue(String propName) {
    DateTime? date = getDateTimeNullableValue(propName);
    if (date == null) {
      throw FormFieldError(errorMessage: "'$propName' must be not null.");
    }
    return date;
  }

  String? getStringNullableValue(String propName) {
    return getValue(propName);
  }

  String getStringValue(String propName) {
    String? v = getValue(propName);
    if (v == null) {
      throw FormFieldError(errorMessage: "'$propName' must be not null.");
    }
    return v;
  }

  int? getIntNullableValue(String propName) {
    String? v = getValue(propName);
    if (v == null || v.trim().isEmpty) {
      return null;
    }
    try {
      return int.parse(v);
    } catch (e) {
      throw FormFieldError(
        errorMessage: "'$propName' must be of int data type.",
      );
    }
  }

  int getIntValue(String propName) {
    int? v = getIntNullableValue(propName);
    if (v == null) {
      throw FormFieldError(errorMessage: "'$propName' must be not null.");
    }
    return v;
  }

  double? getDoubleNullableValue(String propName) {
    String? v = getValue(propName);
    if (v == null) {
      return null;
    }
    try {
      return double.parse(v);
    } catch (e) {
      throw FormFieldError(
        errorMessage: "'$propName' must be of double data type.",
      );
    }
  }

  double getDoubleValue(String propName) {
    double? v = getDoubleNullableValue(propName);
    if (v == null) {
      throw FormFieldError(errorMessage: "'$propName' must be not null.");
    }
    return v;
  }

  bool? getBoolNullableValue(String propName) {
    String? v = getValue(propName);
    if (v == null) {
      return null;
    }
    try {
      return bool.parse(v);
    } catch (e) {
      throw FormFieldError(
        errorMessage: "'$propName' must be of bool data type.",
      );
    }
  }

  bool getBoolValue(String propName) {
    bool? v = getBoolNullableValue(propName);
    if (v == null) {
      throw FormFieldError(errorMessage: "'$propName' must be not null.");
    }
    return v;
  }
}
