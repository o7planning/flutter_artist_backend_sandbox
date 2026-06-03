part of '../model.dart';

@JsonSerializable()
class PaymentGatewayDetail extends PaymentGatewayInfo {
  PaymentGatewayDetail({
    required super.id,
    required super.name,
    required super.active,
  });

  factory PaymentGatewayDetail.fromJson(Map<String, dynamic> json) =>
      _$PaymentGatewayDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGatewayDetailToJson(this);
}
