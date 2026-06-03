part of '../model.dart';

@JsonSerializable()
class CustomerInfo {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'code')
  late String code;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'vip')
  late bool vip;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  CustomerInfo(this.id, this.code, this.name, this.vip, this.imagePath);

  CustomerInfo.named({
    required this.id,
    required this.code,
    required this.name,
    required this.vip,
    required this.imagePath,
  });

  factory CustomerInfo.fromEntity(CustomerData entity) {
    return CustomerInfo.named(
      id: entity.id,
      code: entity.code,
      name: entity.name,
      vip: entity.vip,
      imagePath: entity.imagePath,
    );
  }

  factory CustomerInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
