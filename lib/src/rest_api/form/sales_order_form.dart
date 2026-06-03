import '_form_base.dart';

class SalesOrderForm extends FormBase {
  late int? id;
  late int? customerId;
  late int? employeeId;
  late String orderDateTime;

  SalesOrderForm(super.formData) {
    id = getIntNullableValue("id");
    customerId = getIntValue("customerId");
    employeeId = getIntNullableValue("employeeId");
    orderDateTime = getStringValue("orderDateTime");
  }
}
