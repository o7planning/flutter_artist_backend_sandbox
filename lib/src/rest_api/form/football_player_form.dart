import 'package:dio/dio.dart';

import '_form_base.dart';

// "id": 1,
// "fullName": "Maradona",
// "birthday": "1960-10-30 00:00:00.000",
// "countryId": "AR",
// "description": null,
// "xFiles": null
class FootballPlayerForm extends FormBase {
  late int? id;
  late String fullName;
  late String countryId;
  late DateTime birthday;
  late String? description;
  late MultipartFile? multipartFile;

  FootballPlayerForm(super.formData) {
    id = getIntNullableValue("id");
    countryId = getStringValue("countryId");
    fullName = getStringValue("fullName");
    birthday = getDateValue("birthday");
    description = getStringNullableValue("description");
    multipartFile = getFile("multipartFile");
  }
}
