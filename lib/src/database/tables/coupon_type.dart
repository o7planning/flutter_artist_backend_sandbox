part of '../../../database.dart';

class CouponType extends Table {
  TextColumn get id => text().unique().withLength(min: 1, max: 5)();

  TextColumn get name => text().withLength(min: 1, max: 256)();
}
