part of '../../../database.dart';

class PaymentGateway extends Table {
  TextColumn get id => text().withLength(min: 1, max: 8).unique()();

  TextColumn get name => text().withLength(min: 1, max: 255)();

  BoolColumn get active => boolean()();
}
