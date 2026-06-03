part of '../model.dart';

@JsonSerializable()
class CurrencyInfo {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'symbol')
  String symbol;

  @JsonKey(name: 'name')
  String name;

  CurrencyInfo(this.id, this.symbol, this.name);

  CurrencyInfo.named({
    required this.id,
    required this.symbol,
    required this.name,
  });

  factory CurrencyInfo.fromEntity(CurrencyData currencyData) {
    return CurrencyInfo.named(
      id: currencyData.id,
      symbol: currencyData.symbol,
      name: currencyData.name,
    );
  }

  factory CurrencyInfo.fromJson(Map<String, dynamic> json) =>
      _$CurrencyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
