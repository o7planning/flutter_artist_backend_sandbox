part of '../../../database.dart';

Future<void> initSystemLogs(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/system_logs.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "Severity, Content"
    //
    String severity = values[0].trim();
    String content = values[1].trim();

    await database
        .into(database.systemLog)
        .insert(
          SystemLogCompanion.insert(
            createDateTime: DateTime.now(),
            severity: severity,
            content: content,
          ),
        );
  }
}
