part of '../model.dart';

@JsonSerializable()
class FootballPlayerInfo {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'fullName')
  late String fullName;

  @JsonKey(name: 'birthday', fromJson: __stringToDate, toJson: __dateToString)
  late DateTime birthday;

  @JsonKey(name: 'country')
  late CountryInfo country;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  FootballPlayerInfo(
    this.id,
    this.fullName,
    this.birthday,
    this.country,
    this.imagePath,
  );

  FootballPlayerInfo.named({
    required this.id,
    required this.birthday,
    required this.country,
    required this.fullName,
    required this.imagePath,
  });

  factory FootballPlayerInfo.fromEntity(
    FootballPlayerData entity,
    CountryData country,
  ) {
    return FootballPlayerInfo.named(
      id: entity.id,
      fullName: entity.fullName,
      birthday: entity.birthday,
      country: CountryInfo.fromEntity(country),
      imagePath: getFootballPlayerBase64Image(entity.id) ?? entity.imagePath,
    );
  }

  factory FootballPlayerInfo.fromJson(Map<String, dynamic> json) =>
      _$FootballPlayerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FootballPlayerInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $fullName)";
  }
}
