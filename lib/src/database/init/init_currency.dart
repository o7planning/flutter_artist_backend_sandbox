part of '../../../database.dart';

Future<void> initCurrencies(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/currencies.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    //  @line = "Code, Symbol, Name, Description".
    //
    String code = values[0].trim();
    String symbol = values[1].trim();
    String name = values[2].trim();
    String description = values[3].trim();

    await database
        .into(database.currency)
        .insert(
          CurrencyCompanion.insert(
            id: code,
            symbol: symbol,
            name: name,
            description: Value(description),
          ),
        );
  }
}
