part of '../../../database.dart';

class University extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique().withLength(min: 1, max: 32)();

  TextColumn get name => text().withLength(min: 1, max: 256)();

  TextColumn get nameInEnglish => text().withLength(min: 1, max: 256)();

  BoolColumn get active => boolean()();

  BoolColumn get locked => boolean()();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get description =>
      text().withLength(min: 0, max: 1024).nullable()();

  TextColumn get note => text().withLength(min: 0, max: 256).nullable()();
}
