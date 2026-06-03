part of '../../../database.dart';

Future<void> initLessons(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/lessons.txt",
  );

  List<BookData> books = await database.select(database.book).get();
  Map<String, int> bookMap = {for (var v in books) v.code: v.id};
  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "BookCode , LessonTitle, SeqNum, Locked, Published, Description"
    //
    String bookCode = values[0].trim();
    String title = values[1].trim();
    int seqNum = int.parse(values[2].trim());
    bool locked = bool.parse(values[3].trim());
    bool published = bool.parse(values[4].trim());
    String description = values[5].trim();
    String imageName = values[6].trim();

    await database
        .into(database.lesson)
        .insert(
          LessonCompanion.insert(
            title: title,
            titleInEnglish: title,
            seqNum: seqNum,
            locked: locked,
            published: published,
            publishDate: Value.absentIfNull(DateTime.now()),
            imagePath: Value("/static/images/lesson/$imageName"),
            bookId: bookMap[bookCode]!,
            description: Value.absentIfNull(description),
            note: const Value.absent(),
          ),
        );
  }
}
