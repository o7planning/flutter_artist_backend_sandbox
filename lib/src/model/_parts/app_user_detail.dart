part of '../model.dart';

@JsonSerializable()
class AppUserDetail {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'userName')
  late String userName;

  @JsonKey(name: 'fullName')
  late String fullName;

  @JsonKey(name: 'enabled')
  late bool enabled;

  @JsonKey(name: 'activated')
  late bool activated;

  @JsonKey(name: 'email')
  late String email;

  @JsonKey(name: 'accessToken')
  String? accessToken;

  @JsonKey(name: 'employee')
  EmployeeInfo? employee;

  @JsonKey(name: 'lastActiveDatetime')
  String? lastActiveDatetime;

  @JsonKey(name: 'isSystemUser')
  bool isSystemUser;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  AppUserDetail(
    this.id,
    this.userName,
    this.fullName,
    this.enabled,
    this.activated,
    this.isSystemUser,
    this.imagePath,
    this.accessToken,
    this.email,
    this.employee,
  );

  AppUserDetail.named({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.enabled,
    required this.activated,
    required this.isSystemUser,
    required this.email,
    required this.imagePath,
    required this.employee,
  });

  factory AppUserDetail.fromEntity(
    AppUserData entity,
    EmployeeData? employee,
    EmployeePositionData? position,
  ) {
    return AppUserDetail.named(
      id: entity.id,
      userName: entity.userName,
      fullName: entity.fullName,
      enabled: entity.enabled,
      activated: entity.activated,
      isSystemUser: entity.isSystemUser,
      email: entity.email,
      imagePath: entity.imagePath,
      employee: employee == null || position == null
          ? null
          : EmployeeInfo.fromEntity(employee, position),
    );
  }

  AppUserInfo toAppUserInfo() {
    return AppUserInfo.named(
      id: id,
      userName: userName,
      fullName: fullName,
      enabled: enabled,
      activated: activated,
      isSystemUser: isSystemUser,
      imagePath: imagePath,
    );
  }

  factory AppUserDetail.fromJson(Map<String, dynamic> json) =>
      _$AppUserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $fullName)";
  }
}
