part of '../model.dart';

@JsonSerializable()
class EmployeeInfo {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'empNumber')
  late String empNumber;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'employeePosition')
  EmployeePositionInfo employeePosition;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  EmployeeInfo(this.id, this.empNumber, this.name, this.employeePosition);

  EmployeeInfo.named({
    required this.id,
    required this.empNumber,
    required this.name,
    required this.employeePosition,
    required this.imagePath,
  });

  factory EmployeeInfo.fromEntity(
    EmployeeData entity,
    EmployeePositionData position,
  ) {
    EmployeePositionInfo positionInfo = EmployeePositionInfo.fromEntity(
      position,
    );
    //
    return EmployeeInfo.named(
      id: entity.id,
      empNumber: entity.empNumber,
      name: entity.name,
      employeePosition: positionInfo,
      imagePath: getEmployeeBase64Image(entity.id) ?? entity.imagePath,
    );
  }

  factory EmployeeInfo.fromJson(Map<String, dynamic> json) =>
      _$EmployeeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
