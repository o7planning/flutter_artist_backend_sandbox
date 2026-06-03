part of '../../../database.dart';

class Project extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().withLength(min: 1, max: 32).unique()();

  TextColumn get name => text().withLength(min: 1, max: 255)();

  TextColumn get description =>
      text().withLength(min: 0, max: 256).nullable()();

  TextColumn get note => text().withLength(min: 0, max: 256).nullable()();
}
