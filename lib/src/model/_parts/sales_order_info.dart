part of '../model.dart';

@JsonSerializable()
class SalesOrderInfo {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'orderDateTime')
  late String orderDateTime;

  @JsonKey(name: 'amount')
  late double amount;

  @JsonKey(name: 'taxAmount')
  late double taxAmount;

  @JsonKey(name: 'status')
  late String status;

  SalesOrderInfo(
    this.id,
    this.orderDateTime,
    this.amount,
    this.taxAmount,
    this.status,
  );

  SalesOrderInfo.named({
    required this.id,
    required this.orderDateTime,
    required this.amount,
    required this.taxAmount,
    required this.status,
  });

  factory SalesOrderInfo.fromEntity(SalesOrderData entity) {
    return SalesOrderInfo.named(
      id: entity.id,
      orderDateTime: dateTimeToString(entity.orderDateTime),
      amount: entity.amount,
      taxAmount: entity.taxAmount,
      status: entity.status,
    );
  }

  factory SalesOrderInfo.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderInfoToJson(this);
}
