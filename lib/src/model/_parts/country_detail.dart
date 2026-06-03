part of '../model.dart';

@JsonSerializable()
class CountryDetail {
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

  @JsonKey(name: 'description')
  String? description;

  String get imageUrl {
    return "https://flagcdn.com/108x81/${isoCode2.toLowerCase()}.png";
  }

  CountryDetail(
    this.id,
    this.name,
    this.nameInEnglish,
    this.countryCode,
    this.isoCode2,
    this.isoCode3,
    this.population,
    this.area,
  );

  CountryDetail.named({
    required this.id,
    required this.name,
    required this.nameInEnglish,
    required this.countryCode,
    required this.isoCode2,
    required this.isoCode3,
    required this.population,
    required this.area,
    this.gdp,
  });

  factory CountryDetail.fromEntity(CountryData entity) {
    return CountryDetail.named(
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

  CountryInfo toCountryInfo() {
    return CountryInfo.named(
      id: id,
      name: name,
      nameInEnglish: nameInEnglish,
      countryCode: countryCode,
      isoCode2: isoCode2,
      isoCode3: isoCode3,
      population: population,
      area: area,
      gdp: gdp,
    );
  }

  factory CountryDetail.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
