part of '../../../database.dart';

Future<void> initLanguages(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/languages.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line = "code, name, nameInEnglish, seqNum"
    //
    String code = values[0].trim();
    String name = values[1].trim();
    String nameInEnglish = values[2].trim();
    int seqNum = int.parse(values[3].trim());

    await database
        .into(database.language)
        .insert(
          LanguageCompanion.insert(
            id: code,
            name: name,
            nameInEnglish: nameInEnglish,
            seqNum: seqNum,
          ),
        );
  }
}
