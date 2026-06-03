part of '../../../database.dart';

Future<void> initSupplierTypes(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/supplier_types.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "Code, Name".
    //
    String supplierTypeCode = values[0].trim();
    String name = values[1].trim();

    await database
        .into(database.supplierType)
        .insert(
          SupplierTypeCompanion.insert(code: supplierTypeCode, name: name),
        );
  }
}
