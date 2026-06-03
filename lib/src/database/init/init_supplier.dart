part of '../../../database.dart';

Future<void> initSuppliers(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/suppliers.txt",
  );

  List<SupplierTypeData> supplierTypes = await database
      .select(database.supplierType)
      .get();
  Map<String, int> supplierTypeMap = {
    for (var v in supplierTypes) v.code: v.id,
  };

  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "AlbumCode, Name,YoutubeCode,Locked,Published,ImageName"
    //
    String name = values[0].trim();
    String typeCode = values[1].trim();
    String imageName = values[2].trim();
    String email = values[3].trim();
    String description = values[4].trim();

    await database
        .into(database.supplier)
        .insert(
          SupplierCompanion.insert(
            name: name,
            active: true,
            email: email,
            address: Value.absent(),
            phone: Value.absent(),
            description: Value.absentIfNull(description),
            supplierTypeId: supplierTypeMap[typeCode]!,
            imagePath: Value("/static/images/supplier/$imageName"),
          ),
        );
  }
}
