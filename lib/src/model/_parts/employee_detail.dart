part of '../model.dart';

@JsonSerializable()
class EmployeeDetail extends EmployeeInfo {
  @JsonKey(name: 'email')
  late String email;

  // yyyy-MM-dd
  @JsonKey(name: 'birthday', fromJson: __stringToDate, toJson: __dateToString)
  late DateTime birthday;

  // yyyy-MM-dd
  @JsonKey(name: 'hireDate', fromJson: __stringToDate, toJson: __dateToString)
  DateTime hireDate;

  @JsonKey(name: 'address')
  String? address;

  EmployeeDetail(
    super.id,
    super.empNumber,
    super.name,
    super.employeePosition,
    this.email,
    this.birthday,
    this.hireDate,
    this.address,
  );

  EmployeeDetail.named({
    required super.id,
    required super.empNumber,
    required super.name,
    required super.employeePosition,
    required super.imagePath,
    required this.email,
    required this.birthday,
    required this.hireDate,
    required this.address,
  }) : super.named();

  factory EmployeeDetail.fromEntity(
    EmployeeData employee,
    EmployeePositionData postion,
  ) {
    return EmployeeDetail.named(
      id: employee.id,
      empNumber: employee.empNumber,
      name: employee.name,
      imagePath: getEmployeeBase64Image(employee.id) ?? employee.imagePath,
      employeePosition: EmployeePositionInfo.fromEntity(postion),
      email: employee.email,
      birthday: employee.birthday,
      hireDate: employee.hireDate,
      address: employee.address,
    );
  }

  factory EmployeeDetail.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDetailToJson(this);
}
