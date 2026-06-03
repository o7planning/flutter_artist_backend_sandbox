import '_form_base.dart';

// "id": "1",
// "vip": "true"
class CustomerQuickUpdateVipForm extends FormBase {
  late int? id;
  late bool vip;

  CustomerQuickUpdateVipForm(super.formData) {
    id = getIntNullableValue("id");
    vip = getBoolValue("vip");
  }
}
