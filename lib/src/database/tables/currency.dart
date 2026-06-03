part of '../../../database.dart';

class Currency extends Table {
  TextColumn get id => text().withLength(min: 1, max: 3).unique()();

  TextColumn get symbol => text().withLength(min: 1, max: 32)();

  TextColumn get name => text().withLength(min: 1, max: 256)();

  TextColumn get description =>
      text().withLength(min: 0, max: 1024).nullable()();
}
