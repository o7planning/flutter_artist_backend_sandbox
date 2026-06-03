import '_form_base.dart';

// "id": "2",
// "title": "Birthday Party",
// "content": "Don't forget to buy a gift for today at the new store down the street."
class NoteQuickForm extends FormBase {
  late int? id;
  late String title;
  late String content;

  NoteQuickForm(super.formData) {
    id = getIntNullableValue("id");
    title = getStringValue("title");
    content = getStringValue("content");
  }
}
