import 'package:dio/dio.dart';

import '_form_base.dart';

// "id": 7,
// "employeePositionId": 9,
// "empNumber": "E006",
// "name": "Goofy",
// "email": "goofy@example.com",
// "birthday": "1993-04-20 00:00:00.000",
// "hireDate": "2011-01-22 00:00:00.000",
// "address": null,
// "xFiles": null
class EmployeeForm extends FormBase {
  late int? id;
  late int employeePositionId;
  late String empNumber;
  late String name;
  late String email;
  late String? address;
  late DateTime birthday;
  late DateTime hireDate;
  late MultipartFile? multipartFile;

  EmployeeForm(super.formData) {
    id = getIntNullableValue("id");
    employeePositionId = getIntValue("employeePositionId");
    empNumber = getStringValue("empNumber");
    name = getStringValue("name");
    email = getStringValue("email");
    address = getStringNullableValue("address");
    birthday = getDateValue("birthday");
    hireDate = getDateValue("hireDate");
    multipartFile = getFile("multipartFile");
  }
}
