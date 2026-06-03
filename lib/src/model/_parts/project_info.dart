part of '../model.dart';

@JsonSerializable()
class ProjectInfo {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  ProjectInfo(this.id, this.code, this.name);

  ProjectInfo.named({required this.id, required this.code, required this.name});

  factory ProjectInfo.fromJson(Map<String, dynamic> json) =>
      _$ProjectInfoFromJson(json);

  factory ProjectInfo.fromEntity(ProjectData entity) {
    return ProjectInfo.named(
      id: entity.id,
      code: entity.code,
      name: entity.name,
    );
  }

  Map<String, dynamic> toJson() => _$ProjectInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
