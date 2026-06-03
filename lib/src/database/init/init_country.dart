part of '../../../database.dart';

Future<void> initCountries(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/countries.txt",
  );
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line = "Name, CountryCode,Code2 ,Code3,POPULATION, AREA_KM2,GDP_$USD"
    //
    String name = values[0].trim();
    String countryCode = values[1].trim();
    String isoCode2 = values[2].trim();
    String isoCode3 = values[3].trim();
    int population = int.parse(values[4].trim().replaceAll(",", ""));
    int area = int.parse(values[5].trim().replaceAll(",", ""));
    double? gdp = double.tryParse(values[6].trim());

    // return id.
    await database
        .into(database.country)
        .insert(
          CountryCompanion.insert(
            id: isoCode2,
            code: countryCode,
            name: name,
            nameInEnglish: name,
            countryCode: countryCode,
            isoCode2: isoCode2,
            isoCode3: isoCode3,
            population: population,
            area: area,
            gdp: Value(gdp),
            description: Value.absent(),
          ),
        );
  }
}
