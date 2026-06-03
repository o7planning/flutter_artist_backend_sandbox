part of '../model.dart';

@JsonSerializable()
class BestSellerDetail {
  @JsonKey(includeFromJson: false)
  int get id => employeeId;

  @JsonKey(name: 'employeeId')
  late int employeeId;

  @JsonKey(name: 'employeeNumber')
  late String employeeNumber;

  @JsonKey(name: 'employeeName')
  late String employeeName;

  @JsonKey(name: 'imagePath')
  late String? imagePath;

  @JsonKey(name: 'salesOrderCount')
  late int salesOrderCount;

  @JsonKey(name: 'amountTotal')
  late double amountTotal;

  @JsonKey(name: 'taxAmountTotal')
  late double taxAmountTotal;

  @JsonKey(name: 'estimatedInputAmountTotal')
  late double estimatedInputAmountTotal;

  @JsonKey(name: 'estimatedProfitTotal')
  late double estimatedProfitTotal;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  BestSellerDetail(
    this.employeeId,
    this.employeeNumber,
    this.employeeName,
    this.imagePath,
    this.salesOrderCount,
    this.amountTotal,
    this.taxAmountTotal,
    this.estimatedInputAmountTotal,
    this.estimatedProfitTotal,
  );

  factory BestSellerDetail.fromJson(Map<String, dynamic> json) =>
      _$BestSellerDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerDetailToJson(this);
}
