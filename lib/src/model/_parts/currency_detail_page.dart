part of '../model.dart';

@JsonSerializable()
class CurrencyDetailPage extends PageDataImpl<CurrencyDetail> {
  CurrencyDetailPage({required super.items, required super.paginationInfo});

  factory CurrencyDetailPage.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDetailPageFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDetailPageToJson(this);
}
