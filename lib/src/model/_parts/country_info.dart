part of '../model.dart';

@JsonSerializable()
class CountryInfo {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'nameInEnglish')
  String nameInEnglish;

  @JsonKey(name: 'countryCode')
  String countryCode;

  @JsonKey(name: 'isoCode2')
  String isoCode2;

  @JsonKey(name: 'isoCode3')
  String isoCode3;

  @JsonKey(name: 'population')
  int population;

  @JsonKey(name: 'area')
  int area;

  @JsonKey(name: 'gdp')
  double? gdp;

  CountryInfo(
    this.id,
    this.name,
    this.nameInEnglish,
    this.countryCode,
    this.isoCode2,
    this.isoCode3,
    this.population,
    this.area,
    this.gdp,
  );

  CountryInfo.named({
    required this.id,
    required this.name,
    required this.nameInEnglish,
    required this.countryCode,
    required this.isoCode2,
    required this.isoCode3,
    required this.population,
    required this.area,
    required this.gdp,
  });

  factory CountryInfo.fromEntity(CountryData entity) {
    return CountryInfo.named(
      id: entity.id,
      name: entity.name,
      nameInEnglish: entity.nameInEnglish,
      countryCode: entity.countryCode,
      isoCode2: entity.isoCode2,
      isoCode3: entity.isoCode3,
      population: entity.population,
      area: entity.area,
      gdp: entity.gdp,
    );
  }

  String get imageUrl {
    return "https://flagcdn.com/108x81/${isoCode2.toLowerCase()}.png";
  }

  factory CountryInfo.fromJson(Map<String, dynamic> json) =>
      _$CountryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
