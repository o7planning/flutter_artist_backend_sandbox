part of '../../../database.dart';

Future<void> initFootballPlayers(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/football_players.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "FootballPlayerId,FootballPlayerName"
    //
    String fullName = values[0].trim();
    DateTime birthday = stringToDate(values[1].trim());
    String countryId = values[2].trim();
    String imageName = values[3].trim();

    await database
        .into(database.footballPlayer)
        .insert(
          FootballPlayerCompanion.insert(
            fullName: fullName,
            birthday: birthday,
            countryId: countryId,
            imagePath: Value("/static/images/football-player/$imageName"),
            description: Value.absentIfNull(null),
          ),
        );
  }
}
