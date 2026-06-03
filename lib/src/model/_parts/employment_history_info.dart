part of '../model.dart';

@JsonSerializable()
class EmploymentHistoryInfo {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'employee')
  late EmployeeInfo employee;

  @JsonKey(name: 'fromDate', fromJson: __stringToDate, toJson: __dateToString)
  late DateTime fromDate;

  @JsonKey(
    name: 'toDate',
    fromJson: __stringToNullableDate,
    toJson: __dateToNullableString,
  )
  DateTime? toDate;

  @JsonKey(name: 'employeePosition')
  late EmployeePositionInfo employeePosition;

  EmploymentHistoryInfo(
    this.id,
    this.employee,
    this.fromDate,
    this.employeePosition,
  );

  EmploymentHistoryInfo.named({
    required this.id,
    required this.employee,
    required this.employeePosition,
    required this.fromDate,
    required this.toDate,
  });

  factory EmploymentHistoryInfo.fromEntity(
    EmploymentHistoryData entity,
    EmployeeData employee,
    CompanyData company,
    DepartmentData department,
    EmployeePositionData position,
  ) {
    return EmploymentHistoryInfo.named(
      id: entity.id,
      employeePosition: EmployeePositionInfo.fromEntity(position),
      employee: EmployeeInfo.fromEntity(employee, position),
      fromDate: entity.fromDate,
      toDate: entity.toDate,
    );
  }

  factory EmploymentHistoryInfo.fromJson(Map<String, dynamic> json) =>
      _$EmploymentHistoryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentHistoryInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id)";
  }
}
