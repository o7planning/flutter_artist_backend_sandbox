import '_form_base.dart';

// "id": 1,
// "employeePositionId": 4,
// "companyId": 1,
// "departmentId": 2,
// "employeeId": 1,
// "fromDate": "2001-01-01 00:00:00.000",
// "toDate": "2002-06-12 00:00:00.000"
class EmploymentHistoryForm extends FormBase {
  late int? id;
  late int employeePositionId;
  late int companyId;
  late int departmentId;
  late int employeeId;
  late DateTime fromDate;
  late DateTime toDate;

  EmploymentHistoryForm(super.formData) {
    id = getIntNullableValue("id");
    employeePositionId = getIntValue("employeePositionId");
    companyId = getIntValue("companyId");
    departmentId = getIntValue("departmentId");
    employeeId = getIntValue("employeeId");
    fromDate = getDateValue("fromDate");
    toDate = getDateValue("toDate");
  }
}
