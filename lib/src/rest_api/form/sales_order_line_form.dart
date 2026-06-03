import '_form_base.dart';

class SalesOrderLineForm extends FormBase {
  late int? id;
  late int productId;
  late int salesOrderId;
  late double units;

  SalesOrderLineForm(super.formData) {
    id = getIntNullableValue("id");
    productId = getIntValue("productId");
    salesOrderId = getIntValue("salesOrderId");
    units = getDoubleValue("units");
  }
}
