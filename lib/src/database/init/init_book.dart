part of '../../../database.dart';

Future<void> initBooks(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/books.txt",
  );

  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "Code, Title, SeqNum, Published, Locked, Description, Note"
    //
    String bookCode = values[0].trim();
    String title = values[1].trim();
    int seqNum = int.parse(values[2].trim());
    bool published = bool.parse(values[3].trim());
    bool locked = bool.parse(values[4].trim());
    String imageName = values[5].trim();
    String note = values[6].trim();
    String description = values[7].trim();

    await database
        .into(database.book)
        .insert(
          BookCompanion.insert(
            code: bookCode,
            title: title,
            seqNum: seqNum,
            published: published,
            locked: locked,
            imagePath: Value("/static/images/book/$imageName"),
            description: Value(description),
            note: Value(note),
          ),
        );
  }
}
