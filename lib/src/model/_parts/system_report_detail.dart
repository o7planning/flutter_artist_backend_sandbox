part of '../model.dart';

@JsonSerializable()
class SystemReportDetail {
  @JsonKey(name: "employeeCount")
  int employeeCount;

  @JsonKey(name: "supplierCount")
  int supplierCount;

  @JsonKey(name: "categoryCount")
  int categoryCount;

  @JsonKey(name: "productCount")
  int productCount;

  @JsonKey(name: "saleOrderCount")
  int saleOrderCount;

  @JsonKey(name: "noteCount")
  int noteCount;

  SystemReportDetail(
    this.employeeCount,
    this.supplierCount,
    this.categoryCount,
    this.productCount,
    this.saleOrderCount,
    this.noteCount,
  );

  SystemReportDetail.named({
    required this.employeeCount,
    required this.supplierCount,
    required this.categoryCount,
    required this.productCount,
    required this.saleOrderCount,
    required this.noteCount,
  });

  factory SystemReportDetail.fromJson(Map<String, dynamic> json) =>
      _$SystemReportDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SystemReportDetailToJson(this);
}
