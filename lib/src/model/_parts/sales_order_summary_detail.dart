part of '../model.dart';

/// <pre>
/// {
///   "data" : [ {
///     "dataName" : "Order",
///     "currentValue" : 133.0,
///     "previousValue" : 168.0,
///     "isMoney": false
///   }, {
///     "dataName" : "Customer",
///     "currentValue" : 133.0,
///     "previousValue" : 168.0,
///     "isMoney": false
///   }, {
///     "dataName" : "Amount",
///     "currentValue" : 144019.1,
///     "previousValue" : 170932.1,
///     "isMoney": true
///   }, {
///     "dataName" : "Tax Amount",
///     "currentValue" : 13156.6,
///     "previousValue" : 15398.4,
///     "isMoney": true
///   } ]
/// }
/// </pre>
///
@JsonSerializable()
class SalesOrderSummaryDetail {
  @JsonKey(name: 'data')
  late List<CurrentPreviousValue> data;

  SalesOrderSummaryDetail({required this.data});

  factory SalesOrderSummaryDetail.zero() {
    return SalesOrderSummaryDetail(
      data: [
        CurrentPreviousValue.zero("--"),
        CurrentPreviousValue.zero("--"),
        CurrentPreviousValue.zero("--"),
        CurrentPreviousValue.zero("--"),
      ],
    );
  }

  factory SalesOrderSummaryDetail.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderSummaryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderSummaryDetailToJson(this);
}
