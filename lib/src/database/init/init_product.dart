part of '../../../database.dart';

Future<void> initProducts(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/products.txt",
  );

  List<CategoryData> categories = await database
      .select(database.category)
      .get();
  Map<String, int> categoryMap = {for (var v in categories) v.code: v.id};

  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "Category Code;Product Name;  Price; Tax; Image; Description"
    //
    String categoryCode = values[0].trim();
    String productName = values[1].trim();
    double price = double.parse(values[2].trim());
    double tax = double.parse(values[3].trim());
    String imageName = values[4].trim();
    String description = values[5].trim();

    await database
        .into(database.product)
        .insert(
          ProductCompanion.insert(
            name: productName,
            price: price,
            active: true,
            imagePath: Value("/static/images/product/$imageName"),
            categoryId: categoryMap[categoryCode]!,
            estimatedInputPrice: 0.8 * price,
            taxRate: tax,
            description: Value(description),
          ),
        );
  }
}
