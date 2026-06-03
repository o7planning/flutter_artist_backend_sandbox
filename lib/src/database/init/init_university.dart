part of '../../../database.dart';

Future<void> initUniversities(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/universities.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "Code,Name,ImageName,YoutubeVideoCode,EMAIL,webSite,Description"
    //
    String universityCode = values[0].trim();
    String name = values[1].trim();
    String imageName = values[2].trim();
    String youtubeVideoCode = values[3].trim();
    String email = values[4].trim();
    String website = values[5].trim();
    String description = values[6].trim();

    await database
        .into(database.university)
        .insert(
          UniversityCompanion.insert(
            code: universityCode,
            name: name,
            nameInEnglish: name,
            active: true,
            locked: false,
            imagePath: Value("/static/images/university/$imageName"),
            description: Value(description),
            note: const Value.absent(),
          ),
        );
  }
}
