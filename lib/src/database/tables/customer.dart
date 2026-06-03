part of '../../../database.dart';

class Customer extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique().withLength(min: 1, max: 32)();

  TextColumn get name => text().withLength(min: 1, max: 256)();

  BoolColumn get vip => boolean()();

  TextColumn get address => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get phone => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get email => text().unique().withLength(min: 0, max: 256)();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();
}
