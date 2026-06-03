part of '../model.dart';

@JsonSerializable()
class CommonSummaryDetail {
  @JsonKey(name: 'totalProduct')
  int totalProduct = 0;
  @JsonKey(name: 'totalCustomer')
  int totalCustomer = 0;

  CommonSummaryDetail(this.totalProduct, this.totalCustomer);

  CommonSummaryDetail.named({
    required this.totalProduct,
    required this.totalCustomer,
  });

  factory CommonSummaryDetail.zero() {
    return CommonSummaryDetail.named(totalProduct: 0, totalCustomer: 0);
  }

  factory CommonSummaryDetail.fromJson(Map<String, dynamic> json) =>
      _$CommonSummaryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CommonSummaryDetailToJson(this);
}
