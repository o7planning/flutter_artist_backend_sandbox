part of '../model.dart';

@JsonSerializable()
class CompanyDetail {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'companyIdParent')
  int? companyIdParent;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  CompanyDetail(this.id, this.code, this.name);

  CompanyDetail.named({
    required this.id,
    required this.code,
    required this.name,
    required this.companyIdParent,
    required this.imagePath,
    required this.description,
  });

  factory CompanyDetail.fromEntity(CompanyData entity) {
    return CompanyDetail.named(
      id: entity.id,
      code: entity.code,
      name: entity.name,
      companyIdParent: entity.companyIdParent,
      imagePath: entity.imagePath,
      description: entity.description,
    );
  }

  CompanyInfo toCompanyInfo() {
    return CompanyInfo.named(
      id: id,
      code: code,
      name: name,
      companyIdParent: companyIdParent,
      imagePath: imagePath,
    );
  }

  factory CompanyDetail.fromJson(Map<String, dynamic> json) =>
      _$CompanyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
