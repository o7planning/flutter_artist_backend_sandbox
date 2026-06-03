part of '../model.dart';

@JsonSerializable()
class FootballPlayerDetail extends FootballPlayerInfo {
  @JsonKey(name: 'description')
  String? description;

  FootballPlayerDetail(
    super.id,
    super.fullName,
    super.birthday,
    super.country,
    super.imagePath,
  );

  FootballPlayerDetail.named({
    required super.id,
    required super.fullName,
    required super.birthday,
    required super.country,
    required super.imagePath,
    required this.description,
  }) : super.named();

  factory FootballPlayerDetail.fromEntity(
    FootballPlayerData entity,
    CountryData country,
  ) {
    return FootballPlayerDetail.named(
      id: entity.id,
      fullName: entity.fullName,
      birthday: entity.birthday,
      country: CountryInfo.fromEntity(country),
      imagePath: getFootballPlayerBase64Image(entity.id) ?? entity.imagePath,
      description: entity.description,
    );
  }

  factory FootballPlayerDetail.fromJson(Map<String, dynamic> json) =>
      _$FootballPlayerDetailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FootballPlayerDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $fullName)";
  }
}
