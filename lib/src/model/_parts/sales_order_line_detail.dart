part of '../model.dart';

@JsonSerializable()
class SalesOrderLineDetail {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'salesOrderId')
  int salesOrderId;

  @JsonKey(name: 'product')
  ProductInfo product;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'units')
  double units;

  @JsonKey(name: 'amount')
  double amount;

  @JsonKey(name: 'taxAmount')
  double taxAmount;

  SalesOrderLineDetail(
    this.id,
    this.salesOrderId,
    this.product,
    this.units,
    this.price,
    this.amount,
    this.taxAmount,
  );

  SalesOrderLineDetail.named({
    required this.id,
    required this.salesOrderId,
    required this.product,
    required this.units,
    required this.price,
    required this.amount,
    required this.taxAmount,
  });

  factory SalesOrderLineDetail.fromEntity(
    SalesOrderLineData entity,
    ProductData product,
  ) {
    return SalesOrderLineDetail.named(
      id: entity.id,
      salesOrderId: entity.salesOrderId,
      product: ProductInfo.fromEntity(product),
      units: entity.units,
      price: product.price,
      amount: entity.amount,
      taxAmount: entity.taxAmount,
    );
  }

  factory SalesOrderLineDetail.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderLineDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderLineDetailToJson(this);
}
