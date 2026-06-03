part of '../model.dart';

@JsonSerializable()
class ProjectDetail extends ProjectInfo {
  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  ProjectDetail(super.id, super.code, super.name, this.description, this.note);

  ProjectDetail.named({
    required super.id,
    required super.code,
    required super.name,
    required this.description,
    required this.note,
  }) : super.named();

  factory ProjectDetail.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailFromJson(json);

  factory ProjectDetail.fromEntity(ProjectData entity) {
    return ProjectDetail.named(
      id: entity.id,
      name: entity.name,
      code: entity.code,
      description: entity.description,
      note: entity.note,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$ProjectDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
