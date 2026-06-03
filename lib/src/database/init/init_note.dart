part of '../../../database.dart';

Future<void> initNotes(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/notes.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "Title, Content"
    //
    String title = values[0].trim();
    String content = values[1].trim().replaceAll("\\n", "\n");

    await database
        .into(database.note)
        .insert(
          NoteCompanion.insert(
            title: title,
            content: content,
            createDateTime: DateTime.now(),
            colorCode: DemoColorUtils.getRandomHex16ColorCode(),
          ),
        );
  }
}
