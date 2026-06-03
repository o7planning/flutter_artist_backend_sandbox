part of '../model.dart';

@JsonSerializable()
class ContributorInfoPage extends PageDataImpl<ContributorInfo> {
  ContributorInfoPage({required super.paginationInfo, required super.items});

  factory ContributorInfoPage.fromJson(Map<String, dynamic> json) =>
      _$ContributorInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$ContributorInfoPageToJson(this);
}
