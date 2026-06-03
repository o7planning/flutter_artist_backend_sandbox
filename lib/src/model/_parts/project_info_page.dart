part of '../model.dart';

@JsonSerializable()
class ProjectInfoPage extends PageDataImpl<ProjectInfo> {
  ProjectInfoPage({required super.paginationInfo, required super.items});

  factory ProjectInfoPage.fromJson(Map<String, dynamic> json) =>
      _$ProjectInfoPageFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectInfoPageToJson(this);
}
