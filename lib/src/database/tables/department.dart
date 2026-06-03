part of '../../../database.dart';

class Department extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique().withLength(min: 1, max: 32)();

  TextColumn get name => text().withLength(min: 1, max: 256)();

  IntColumn get companyId => integer().references(Company, #id)();

  // IntColumn get managerId => integer().nullable().references(Employee, #id)();
  IntColumn get managerId => integer().nullable()();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get description =>
      text().withLength(min: 0, max: 1024).nullable()();
}
