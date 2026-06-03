part of '../../../database.dart';

class NotificationMessage extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 255)();

  TextColumn get message => text().withLength(min: 1, max: 255)();

  DateTimeColumn get createDateTime => dateTime()();

  BoolColumn get read => boolean()();

  TextColumn get type => text().withLength(min: 1, max: 32)();
}
