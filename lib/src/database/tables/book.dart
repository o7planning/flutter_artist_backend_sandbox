part of '../../../database.dart';

class Book extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().withLength(min: 1, max: 32).unique()();

  TextColumn get title => text().withLength(min: 1, max: 255)();

  IntColumn get seqNum => integer()();

  BoolColumn get published => boolean()();

  BoolColumn get locked => boolean()();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get description =>
      text().withLength(min: 0, max: 1024).nullable()();

  TextColumn get note => text().withLength(min: 0, max: 256).nullable()();
}
