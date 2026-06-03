part of '../model.dart';

@JsonSerializable()
class CurrencyDetail {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String? description;

  CurrencyDetail(this.id, this.symbol, this.name);

  CurrencyDetail.named({
    required this.id,
    required this.symbol,
    required this.name,
    this.description,
  });

  factory CurrencyDetail.fromEntity(CurrencyData entity) {
    return CurrencyDetail.named(
      id: entity.id,
      symbol: entity.symbol,
      name: entity.name,
      description: entity.description,
    );
  }

  CurrencyInfo toCurrencyInfo() {
    return CurrencyInfo.named(id: id, name: name, symbol: symbol);
  }

  factory CurrencyDetail.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
