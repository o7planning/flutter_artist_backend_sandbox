part of '../model.dart';

@JsonSerializable()
class SalesOrderLineInfoPage extends PageDataImpl<SalesOrderLineInfo> {
  SalesOrderLineInfoPage({required super.paginationInfo, required super.items});

  factory SalesOrderLineInfoPage.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderLineInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderLineInfoPageToJson(this);
}
