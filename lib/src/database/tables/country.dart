part of '../../../database.dart';

class Country extends Table {
  TextColumn get id => text().withLength(min: 2, max: 2).unique()();

  TextColumn get code => text().withLength(min: 1, max: 32)();

  TextColumn get name => text().withLength(min: 1, max: 256)();

  TextColumn get nameInEnglish => text().withLength(min: 1, max: 256)();

  TextColumn get countryCode => text().withLength(min: 1, max: 32)();

  TextColumn get isoCode2 => text().withLength(min: 1, max: 32)();

  TextColumn get isoCode3 => text().withLength(min: 1, max: 32)();

  IntColumn get population => integer()();

  IntColumn get area => integer()();

  RealColumn get gdp => real().nullable()();

  TextColumn get description =>
      text().withLength(min: 0, max: 1024).nullable()();
}
