part of '../../../database.dart';

Future<void> initCategories(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/categories.txt",
  );

  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "CategoryCode; CategoryName; CategoryImage".
    //
    String categoryCode = values[0].trim();
    String name = values[1].trim();
    String imageName = values[2].trim();

    await database
        .into(database.category)
        .insert(
          CategoryCompanion.insert(
            code: categoryCode,
            name: name,
            imagePath: Value("/static/images/category/$imageName"),
            description: Value.absent(),
          ),
        );
  }
}
