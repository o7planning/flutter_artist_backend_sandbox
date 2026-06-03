part of '../../../database.dart';

class SystemLog extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get createDateTime => dateTime()();

  TextColumn get severity => text().withLength(min: 1, max: 32)();

  TextColumn get content => text().withLength(min: 1, max: 255)();
}
