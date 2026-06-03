part of '../model.dart';

@JsonSerializable()
class CompanyExtDetail extends CompanyDetail {
  @JsonKey(name: 'departments', defaultValue: [])
  List<DepartmentDetail> departments = [];

  CompanyExtDetail(super.id, super.code, super.name);

  factory CompanyExtDetail.fromJson(Map<String, dynamic> json) =>
      _$CompanyExtDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyExtDetailToJson(this);
}
