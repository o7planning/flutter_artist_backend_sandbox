part of '../model.dart';

@JsonSerializable()
class SalesOrderLineInfo {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'salesOrderId')
  int salesOrderId;

  @JsonKey(name: 'product')
  ProductInfo product;

  @JsonKey(name: 'units')
  double units;

  @JsonKey(name: 'amount')
  double amount;

  @JsonKey(name: 'price')
  double price;

  SalesOrderLineInfo(
    this.id,
    this.salesOrderId,
    this.product,
    this.units,
    this.price,
    this.amount,
  );

  SalesOrderLineInfo.named({
    required this.id,
    required this.salesOrderId,
    required this.product,
    required this.units,
    required this.price,
    required this.amount,
  });

  factory SalesOrderLineInfo.fromEntity(
    SalesOrderLineData entity,
    ProductData product,
  ) {
    return SalesOrderLineInfo.named(
      id: entity.id,
      salesOrderId: entity.salesOrderId,
      product: ProductInfo.fromEntity(product),
      units: entity.units,
      price: product.price,
      amount: entity.amount,
    );
  }

  factory SalesOrderLineInfo.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderLineInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SalesOrderLineInfoToJson(this);
}
