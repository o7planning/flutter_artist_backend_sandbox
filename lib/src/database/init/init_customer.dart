part of '../../../database.dart';

Future<void> initCustomers(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/customers.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line = "Code, CustomerName,Address,phone,email,image"
    //
    String code = values[0].trim();
    String name = values[1].trim();
    String address = values[2].trim();
    String phone = values[3].trim();
    String email = values[4].trim();
    String imageName = values[5].trim();

    await database
        .into(database.customer)
        .insert(
          CustomerCompanion.insert(
            code: code,
            name: name,
            vip: false,
            address: Value.absentIfNull(address),
            email: email,
            imagePath: Value("/static/images/customer/$imageName"),
          ),
        );
  }
}
