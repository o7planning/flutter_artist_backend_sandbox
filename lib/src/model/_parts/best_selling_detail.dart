part of '../model.dart';

@JsonSerializable()
class BestSellingDetail {
  @JsonKey(includeFromJson: false)
  int get id => productId;

  @JsonKey(name: 'categoryId')
  late int categoryId;

  @JsonKey(name: 'categoryName')
  late String categoryName;

  @JsonKey(name: 'productId')
  late int productId;

  @JsonKey(name: 'productName')
  late String productName;

  @JsonKey(name: 'productImagePath')
  String? productImagePath;

  @JsonKey(name: 'unitsTotal')
  late double unitsTotal;

  @JsonKey(name: 'amountTotal')
  late double amountTotal;

  @JsonKey(name: 'taxAmountTotal')
  late double taxAmountTotal;

  BestSellingDetail(
    this.categoryId,
    this.categoryName,
    this.productId,
    this.productName,
    this.productImagePath,
    this.unitsTotal,
    this.amountTotal,
    this.taxAmountTotal,
  );

  BestSellingDetail.named({
    required this.categoryId,
    required this.categoryName,
    required this.productId,
    required this.productName,
    required this.productImagePath,
    required this.unitsTotal,
    required this.amountTotal,
    required this.taxAmountTotal,
  });

  factory BestSellingDetail.fromJson(Map<String, dynamic> json) =>
      _$BestSellingDetailFromJson(json);

  // IMPORTANT:
  Map<String, dynamic> toJson() => _$BestSellingDetailToJson(this);
}
