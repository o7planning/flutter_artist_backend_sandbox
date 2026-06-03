part of '../../../database.dart';

Future<void> initProjects(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/projects.txt",
  );

  List<CategoryData> categories = await database
      .select(database.category)
      .get();
  Map<String, int> categoryMap = {for (var v in categories) v.code: v.id};

  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "ProjectCode;ProjectName;Description"
    //
    String projectCode = values[0].trim();
    String projectName = values[1].trim();
    String description = values[2].trim();

    await database
        .into(database.project)
        .insert(
          ProjectCompanion.insert(
            code: projectCode,
            name: projectName,
            description: Value.absentIfNull(null),
          ),
        );
  }
}
