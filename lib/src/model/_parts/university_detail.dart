part of '../model.dart';

@JsonSerializable()
class UniversityDetail {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'nameInEnglish')
  String? nameInEnglish;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  UniversityDetail(this.id, this.code, this.name, this.active, this.locked);

  UniversityDetail.named({
    required this.id,
    required this.code,
    required this.name,
    required this.active,
    required this.locked,
    this.imagePath,
    this.description,
    this.note,
  });

  factory UniversityDetail.fromEntity(UniversityData entity) {
    return UniversityDetail.named(
      id: entity.id,
      code: entity.code,
      name: entity.name,
      active: entity.active,
      locked: entity.locked,
      imagePath: entity.imagePath,
      description: entity.description,
      note: entity.note,
    );
  }

  UniversityInfo toUniversityInfo() {
    return UniversityInfo.named(
      id: id,
      code: code,
      name: name,
      locked: locked,
      active: active,
      imagePath: imagePath,
    );
  }

  factory UniversityDetail.fromJson(Map<String, dynamic> json) =>
      _$UniversityDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
