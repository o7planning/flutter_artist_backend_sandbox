part of '../../../database.dart';

class Coupon extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique().withLength(min: 1, max: 32)();

  TextColumn get name => text().withLength(min: 1, max: 256)();

  BoolColumn get active => boolean()();

  TextColumn get type =>
      text().withLength(min: 1, max: 32).references(CouponType, #id)();

  TextColumn get description =>
      text().withLength(min: 0, max: 1024).nullable()();
}
