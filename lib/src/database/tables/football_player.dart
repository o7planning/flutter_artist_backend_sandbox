part of '../../../database.dart';

class FootballPlayer extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get fullName => text().withLength(min: 1, max: 256)();

  DateTimeColumn get birthday => dateTime()();

  TextColumn get countryId =>
      text().withLength(min: 2, max: 2).references(Country, #id)();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get description =>
      text().withLength(min: 0, max: 1024).nullable()();
}
