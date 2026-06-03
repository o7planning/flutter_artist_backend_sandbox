part of '../../../database.dart';

Future<void> initCompanies(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/companies.txt",
  );
  final Map<String, int> map = {};

  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "CompanyCode; CompanyName; CompanyImage; CompanyParentCode; Description".
    //
    String companyCode = values[0].trim();
    String name = values[1].trim();
    String imageName = values[2].trim();
    String companyCodeParent = values[3].trim();
    String description = values[4].trim();

    int? companyIdParent;
    if (companyCodeParent.isNotEmpty) {
      companyIdParent = map[companyCodeParent]!;
    }

    int id = await database
        .into(database.company)
        .insert(
          CompanyCompanion.insert(
            code: companyCode,
            companyIdParent: Value.absentIfNull(companyIdParent),
            name: name,
            imagePath: Value("/static/images/company/$imageName"),
            description: Value(description),
          ),
        );
    map[companyCode] = id;
  }
}
