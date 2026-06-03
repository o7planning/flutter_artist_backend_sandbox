import '_form_base.dart';

// "id": "1",
// "code": "CUS-011"
class CustomerQuickUpdateCodeForm extends FormBase {
  late int? id;
  late String code;

  CustomerQuickUpdateCodeForm(super.formData) {
    id = getIntNullableValue("id");
    code = getStringValue("code");
  }
}
