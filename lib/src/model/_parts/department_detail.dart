part of '../model.dart';

@JsonSerializable()
class DepartmentDetail {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'companyId')
  int companyId;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'manager')
  EmployeeInfo? manager;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  DepartmentDetail(this.id, this.code, this.name, this.companyId);

  DepartmentDetail.named({
    required this.id,
    required this.code,
    required this.name,
    required this.companyId,
    required this.description,
    required this.imagePath,
  });

  factory DepartmentDetail.fromEntity(DepartmentData entity) {
    return DepartmentDetail.named(
      id: entity.id,
      code: entity.code,
      name: entity.name,
      imagePath: entity.imagePath,
      companyId: entity.companyId,
      description: entity.description,
    );
  }

  DepartmentInfo toDepartmentInfo() {
    return DepartmentInfo.named(
      id: id,
      code: code,
      name: name,
      imagePath: imagePath,
      companyId: companyId,
      manager: manager,
    );
  }

  factory DepartmentDetail.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
