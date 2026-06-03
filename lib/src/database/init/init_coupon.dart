part of '../../../database.dart';

Future<void> initCoupons(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/coupons.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line = "Type,Code,ExpiryDate,Name,Description".
    //
    String typeCode = values[0].trim();
    String code = values[1].trim();
    String expiryDateStr = values[2].trim();
    String name = values[3].trim();
    String description = values[4].trim();
    //

    await database
        .into(database.coupon)
        .insert(
          CouponCompanion.insert(
            code: code,
            name: name,
            active: true,
            type: typeCode,
            description: Value.absentIfNull(description),
          ),
        );
  }
}
