part of '../../../database.dart';

class Supplier extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 255)();

  BoolColumn get active => boolean()();

  TextColumn get email => text().unique().withLength(min: 1, max: 64)();

  TextColumn get address => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get phone => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get description =>
      text().withLength(min: 0, max: 1024).nullable()();

  IntColumn get supplierTypeId =>
      integer().references(SupplierType, #id)(); // Foreign key

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();
}
