part of '../model.dart';

@JsonSerializable()
class CategoryDetail extends CategoryInfo {
  @JsonKey(name: 'description')
  String? description;

  CategoryDetail(super.id, super.name, super.imagePath);

  CategoryDetail.named({
    required super.id,
    required super.name,
    required super.imagePath,
    this.description,
  }) : super.named();

  factory CategoryDetail.fromEntity(CategoryData entity) {
    return CategoryDetail.named(
      id: entity.id,
      name: entity.name,
      imagePath: entity.imagePath,
      description: entity.description,
    );
  }

  factory CategoryDetail.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
