part of '../model.dart';

@JsonSerializable()
class ContributorDetail extends ContributorInfo {
  ContributorDetail(super.id, super.appUser);

  factory ContributorDetail.fromJson(Map<String, dynamic> json) =>
      _$ContributorDetailFromJson(json);

  factory ContributorDetail.fromEntity(
    ContributorData contributor,
    AppUserData appUser,
  ) {
    final appUserInfo = AppUserInfo.fromEntity(appUser);
    return ContributorDetail(contributor.id, appUserInfo);
  }

  @override
  Map<String, dynamic> toJson() => _$ContributorDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}(${appUser.userName})";
  }
}
