part of '../model.dart';

@JsonSerializable()
class EmploymentHistoryDetail {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'employee')
  EmployeeInfo employee;

  @JsonKey(name: 'department')
  DepartmentInfo department;

  @JsonKey(name: 'company')
  CompanyInfo company;

  @JsonKey(name: 'employeePosition')
  EmployeePositionInfo employeePosition;

  @JsonKey(name: 'fromDate', fromJson: __stringToDate, toJson: __dateToString)
  DateTime fromDate;

  @JsonKey(
    name: 'toDate',
    fromJson: __stringToNullableDate,
    toJson: __dateToNullableString,
  )
  DateTime? toDate;

  EmploymentHistoryDetail(
    this.id,
    this.employee,
    this.department,
    this.company,
    this.employeePosition,
    this.fromDate,
    this.toDate,
  );

  EmploymentHistoryDetail.named({
    required this.id,
    required this.employee,
    required this.department,
    required this.company,
    required this.employeePosition,
    required this.fromDate,
    required this.toDate,
  });

  factory EmploymentHistoryDetail.fromEntity(
    EmploymentHistoryData entity,
    EmployeeData employee,
    CompanyData company,
    DepartmentData department,
    EmployeePositionData position,
  ) {
    return EmploymentHistoryDetail.named(
      id: entity.id,
      employee: EmployeeInfo.fromEntity(employee, position),
      employeePosition: EmployeePositionInfo.fromEntity(position),
      company: CompanyInfo.fromEntity(company),
      department: DepartmentInfo.fromEntity(department),
      fromDate: entity.fromDate,
      toDate: entity.toDate,
    );
  }

  EmploymentHistoryInfo toEmploymentHistoryInfo() {
    return EmploymentHistoryInfo.named(
      id: id,
      employee: employee,
      fromDate: fromDate,
      toDate: toDate,
      employeePosition: employeePosition,
    );
  }

  factory EmploymentHistoryDetail.fromJson(Map<String, dynamic> json) =>
      _$EmploymentHistoryDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EmploymentHistoryDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id)";
  }
}
