part of '../model.dart';

@JsonSerializable()
class LoggedInUserData {
  @JsonKey(name: 'appUser')
  AppUserDetail appUser;

  @JsonKey(name: 'accessToken')
  String accessToken;

  // for OAuth2Token
  @JsonKey(name: "expiresIn")
  int? expiresIn;

  // for OAuth2Token
  @JsonKey(name: "refreshToken")
  String? refreshToken;

  // for OAuth2Token
  @JsonKey(name: "scope")
  String? scope;

  // for OAuth2Token
  @JsonKey(name: "tokenType")
  String? tokenType;

  LoggedInUserData(
    this.appUser,
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
    this.scope,
    this.tokenType,
  );

  LoggedInUserData.named({
    required this.appUser,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.scope,
    required this.tokenType,
  });

  factory LoggedInUserData.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoggedInUserDataToJson(this);
}
