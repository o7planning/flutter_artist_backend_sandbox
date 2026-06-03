part of '../../../database.dart';

Future<void> initCouponTypes(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/coupon_types.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line = "code, name"
    //
    String code = values[0].trim();
    String name = values[1].trim();
    //

    await database
        .into(database.couponType)
        .insert(CouponTypeCompanion.insert(id: code, name: name));
  }
}
