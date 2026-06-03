part of '../../../database.dart';

class SalesOrder extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get orderDateTime => dateTime()();

  RealColumn get amount => real()();

  RealColumn get taxAmount => real()();

  TextColumn get status => text().withLength(min: 1, max: 32)();

  IntColumn get sellerId => integer().references(Employee, #id)();

  IntColumn get customerId => integer().references(Customer, #id)();
}
