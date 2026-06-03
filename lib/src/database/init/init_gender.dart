part of '../../../database.dart';

Future<void> initGenders(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/genders.txt",
  );

  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    //  @line = "Code, Symbol, Name, Description".
    //
    String code = values[0].trim();
    String name = values[1].trim();

    await database
        .into(database.gender)
        .insert(GenderCompanion.insert(id: code, name: name));
  }
}
