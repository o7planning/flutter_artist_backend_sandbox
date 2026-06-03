part of '../../../database.dart';

Future<void> initTeachers(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/teachers.txt",
  );

  List<UniversityData> universities = await database
      .select(database.university)
      .get();
  Map<String, int> universityMap = {for (var v in universities) v.code: v.id};
  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "UniversityCode;FullName; EmailSuffix;Image;GenderCode;Position;Birthday"
    //
    String universityCode = values[0].trim();
    String fullName = values[1].trim();
    String emailSuffix = values[2].trim();
    String imageName = values[3].trim();
    String genderCode = values[4].trim();
    String positionCode = values[5].trim();
    DateTime birthday = stringToDate(values[6].trim());

    await database
        .into(database.teacher)
        .insert(
          TeacherCompanion.insert(
            fullName: fullName,
            birthday: birthday,
            genderId: genderCode,
            teacherPositionId: positionCode,
            locked: false,
            active: true,
            universityId: universityMap[universityCode]!,
            countryId: const Value.absent(),
            youtubeVideoCode: const Value.absent(),
            email: fullName.toLowerCase().replaceAll("\\s+", ".") + emailSuffix,
            skype: const Value.absent(),
            facebook: const Value.absent(),
            phoneNumber: const Value.absent(),
            description: Value.absent(),
            note: const Value.absent(),
            imagePath: Value("/static/images/teacher/$imageName"),
          ),
        );
  }
}
