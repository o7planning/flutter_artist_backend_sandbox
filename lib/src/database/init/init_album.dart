part of '../../../database.dart';

Future<void> initAlbums(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/albums.txt",
  );

  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    // # Code, Title, SeqNum, Published, Locked, Description, Note, ImageName
    String code = values[0].trim();
    String title = values[1].trim();
    int seqNum = int.parse(values[2].trim());
    bool published = bool.parse(values[3].trim());
    bool locked = bool.parse(values[4].trim());
    String description = values[5].trim();
    String note = values[6].trim();
    String imageName = values[7].trim();

    await database
        .into(database.album)
        .insert(
          AlbumCompanion.insert(
            code: code,
            name: title,
            nameInEnglish: title,
            seqNum: seqNum,
            published: published,
            locked: locked,
            imagePath: Value("/static/images/album/$imageName"),
            publishedSongCount: 0,
            totalSongCount: 0,
            description: Value(description),
            note: Value(note),
          ),
        );
  }
}
