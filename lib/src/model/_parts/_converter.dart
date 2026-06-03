part of '../model.dart';

DateTime? __stringToNullableDate(dynamic json) {
  if (json == null) {
    return null;
  }
  if (json is String) {
    return stringToDate(json);
  }
  throw ArgumentError('Invalid type for DateTime conversion: $json');
}

DateTime __stringToDate(dynamic json) {
  if (json == null) {
    throw ArgumentError("DateTime null");
  }
  if (json is String) {
    return stringToDate(json);
  }
  throw ArgumentError('Invalid type for DateTime conversion: $json');
}

String __dateToString(DateTime instance) {
  if (instance == null) {
    throw ArgumentError("DateTime null");
  }
  return dateToString(instance);
}

String? __dateToNullableString(DateTime? instance) {
  if (instance == null) {
    return null;
  }
  return dateToString(instance);
}
