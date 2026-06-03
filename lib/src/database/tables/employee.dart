part of '../../../database.dart';

class Employee extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get empNumber => text().unique().withLength(min: 1, max: 32)();

  TextColumn get name => text().withLength(min: 1, max: 256)();

  TextColumn get email => text().unique().withLength(min: 1, max: 64)();

  IntColumn get employeePositionId =>
      integer().references(EmployeePosition, #id)();

  IntColumn get departmentId => integer().references(Department, #id)();

  DateTimeColumn get birthday => dateTime()();

  DateTimeColumn get hireDate => dateTime()();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get address => text().withLength(min: 0, max: 256).nullable()();
}
