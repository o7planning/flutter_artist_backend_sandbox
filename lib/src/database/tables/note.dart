part of '../../../database.dart';

class Note extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 255)();

  TextColumn get content => text().withLength(min: 1, max: 1024)();

  DateTimeColumn get createDateTime => dateTime()();

  TextColumn get colorCode => text().withLength(min: 7, max: 8)();
}
