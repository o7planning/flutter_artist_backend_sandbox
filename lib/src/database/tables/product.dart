part of '../../../database.dart';

class Product extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 255)();

  RealColumn get price => real()();

  BoolColumn get active => boolean()();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();

  IntColumn get categoryId => integer().references(Category, #id)();

  RealColumn get estimatedInputPrice => real()();

  RealColumn get taxRate => real()();

  TextColumn get description =>
      text().withLength(min: 0, max: 4096).nullable()();
}
