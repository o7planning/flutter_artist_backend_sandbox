part of '../../../database.dart';

class Company extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get companyIdParent =>
      integer().references(Company, #id).nullable()();

  TextColumn get code => text().unique().withLength(min: 1, max: 32)();

  TextColumn get name => text().withLength(min: 1, max: 256)();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get description =>
      text().withLength(min: 0, max: 1024).nullable()();
}
