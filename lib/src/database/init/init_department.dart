part of '../../../database.dart';

Future<void> initDepartments(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/departments.txt",
  );
  //
  List<CompanyData> companies = await database.select(database.company).get();
  Map<String, int> companyMap = {for (var v in companies) v.code: v.id};
  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "DepartmentCode, Department Name, DepartmentImage, CompanyCode"
    //
    String deptCode = values[0].trim();
    String name = values[1].trim();
    String imageName = values[2].trim();
    String companyCode = values[3].trim();
    //
    await database
        .into(database.department)
        .insert(
          DepartmentCompanion.insert(
            code: deptCode,
            name: name,
            companyId: companyMap[companyCode]!,
            managerId: const Value.absent(),
            imagePath: Value("/static/images/department/$imageName"),
            description: const Value.absent(),
          ),
        );
  }
}
