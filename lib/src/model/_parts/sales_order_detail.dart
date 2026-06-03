part of '../model.dart';

@JsonSerializable()
class SalesOrderDetail extends SalesOrderInfo {
  @JsonKey(name: 'seller')
  EmployeeInfo? seller;

  @JsonKey(name: 'customer')
  CustomerInfo? customer;

  @JsonKey(name: 'salesOrderLines')
  List<SalesOrderLineDetail> salesOrderLines = [];

  SalesOrderDetail(
    super.id,
    super.orderDateTime,
    super.amount,
    super.taxAmount,
    super.status,
  );

  SalesOrderDetail.named({
    required super.id,
    required super.orderDateTime,
    required super.amount,
    required super.taxAmount,
    required super.status,
    required this.seller,
    required this.customer,
  }) : super.named();

  factory SalesOrderDetail.fromEntity(
    SalesOrderData entity,
    EmployeeData? employee,
    EmployeePositionData? position,
    CustomerData? customer,
  ) {
    return SalesOrderDetail.named(
      id: entity.id,
      orderDateTime: dateTimeToString(entity.orderDateTime),
      amount: entity.amount,
      taxAmount: entity.taxAmount,
      status: entity.status,
      seller: employee == null
          ? null
          : EmployeeInfo.fromEntity(employee, position!),
      customer: customer == null ? null : CustomerInfo.fromEntity(customer),
    );
  }

  factory SalesOrderDetail.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderDetailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SalesOrderDetailToJson(this);
}
