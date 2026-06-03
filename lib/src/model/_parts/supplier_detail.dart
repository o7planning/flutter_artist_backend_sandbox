part of '../model.dart';

@JsonSerializable()
class SupplierDetail {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'email')
  late String email;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'supplierType')
  SupplierTypeInfo supplierType;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  SupplierDetail(
    this.id,
    this.name,
    this.active,
    this.email,
    this.supplierType,
  );

  SupplierDetail.named({
    required this.id,
    required this.name,
    required this.active,
    required this.email,
    required this.address,
    required this.phone,
    required this.supplierType,
    required this.imagePath,
  });

  factory SupplierDetail.fromEntity(
    SupplierData entity,
    SupplierTypeData supplierType,
  ) {
    return SupplierDetail.named(
      id: entity.id,
      name: entity.name,
      active: entity.active,
      email: entity.email,
      address: entity.address,
      phone: entity.phone,
      imagePath: getSupplierBase64Image(entity.id) ?? entity.imagePath,
      supplierType: SupplierTypeInfo.fromEntity(supplierType),
    );
  }

  SupplierInfo toSupplierInfo() {
    return SupplierInfo.named(
      id: id,
      name: name,
      active: active,
      supplierType: supplierType,
      imagePath: imagePath,
    );
  }

  factory SupplierDetail.fromJson(Map<String, dynamic> json) =>
      _$SupplierDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
