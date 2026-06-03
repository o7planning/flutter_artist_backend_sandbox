part of '../../../database.dart';

Future<void> initSongs(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/songs.txt",
  );

  List<AlbumData> albums = await database.select(database.album).get();
  Map<String, int> albumMap = {for (var v in albums) v.code: v.id};

  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "AlbumID,SongName,Price,Tax,ImageName"
    //
    String albumCode = values[0].trim();
    String imageName = values[1].trim();
    String name = values[2].trim();
    String youtubeCode = values[3].trim();
    bool locked = bool.parse(values[4].trim());
    bool published = bool.parse(values[5].trim());

    await database
        .into(database.song)
        .insert(
          SongCompanion.insert(
            name: name,
            locked: locked,
            published: published,
            imagePath: Value("/static/images/song/$imageName"),
            description: Value.absentIfNull(null),
            note: Value.absentIfNull(null),
            youtubeCode: Value.absentIfNull(youtubeCode),
            albumId: albumMap[albumCode]!,
          ),
        );
  }
}
