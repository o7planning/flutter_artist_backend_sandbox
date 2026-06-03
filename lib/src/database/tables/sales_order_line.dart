part of '../../../database.dart';

class SalesOrderLine extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get salesOrderId => integer().references(SalesOrder, #id)();

  IntColumn get productId => integer().references(Product, #id)();

  RealColumn get units => real()();

  RealColumn get amount => real()();

  RealColumn get taxAmount => real()();
}
