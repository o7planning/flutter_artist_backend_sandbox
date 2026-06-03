part of '../model.dart';

@JsonSerializable()
class SupplierInfo {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'supplierType')
  SupplierTypeInfo supplierType;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  SupplierInfo(this.id, this.name, this.active, this.supplierType);

  SupplierInfo.named({
    required this.id,
    required this.name,
    required this.active,
    required this.supplierType,
    required this.imagePath,
  });

  factory SupplierInfo.fromEntity(
    SupplierData entity,
    SupplierTypeData supplierType,
  ) {
    return SupplierInfo.named(
      id: entity.id,
      name: entity.name,
      active: entity.active,
      supplierType: SupplierTypeInfo.fromEntity(supplierType),
      imagePath: getSupplierBase64Image(entity.id) ?? entity.imagePath,
    );
  }

  factory SupplierInfo.fromJson(Map<String, dynamic> json) =>
      _$SupplierInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
