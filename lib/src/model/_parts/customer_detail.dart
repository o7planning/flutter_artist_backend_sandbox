part of '../model.dart';

@JsonSerializable()
class CustomerDetail {
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

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'email')
  String? email;

  CustomerDetail(
    this.id,
    this.code,
    this.name,
    this.vip,
    this.imagePath,
    this.address,
    this.email,
    this.phone,
  );

  CustomerDetail.named({
    required this.id,
    required this.code,
    required this.name,
    required this.vip,
    required this.imagePath,
    required this.address,
    required this.email,
    required this.phone,
  });

  factory CustomerDetail.fromEntity(CustomerData entity) {
    return CustomerDetail.named(
      id: entity.id,
      code: entity.code,
      name: entity.name,
      vip: entity.vip,
      imagePath: entity.imagePath,
      address: entity.address,
      email: entity.email,
      phone: entity.phone,
    );
  }

  CustomerInfo toCustomerInfo() {
    return CustomerInfo.named(
      id: id,
      code: code,
      name: name,
      vip: vip,
      imagePath: imagePath,
    );
  }

  factory CustomerDetail.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
