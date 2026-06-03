part of '../../../database.dart';

Future<void> initEmployeePositions(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/employee_positions.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "Code, Name"
    //
    String employeePositionCode = values[0].trim();
    String name = values[1].trim();

    await database
        .into(database.employeePosition)
        .insert(
          EmployeePositionCompanion.insert(
            code: employeePositionCode,
            name: name,
          ),
        );
  }
}
