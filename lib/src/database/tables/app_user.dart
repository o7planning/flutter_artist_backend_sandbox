part of '../../../database.dart';

class AppUser extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get userName => text().unique().withLength(min: 1, max: 32)();

  TextColumn get email => text().unique().withLength(min: 1, max: 64)();

  TextColumn get fullName => text().withLength(min: 1, max: 255)();

  TextColumn get encryptedPassword => text().withLength(min: 1, max: 255)();

  BoolColumn get enabled => boolean()();

  BoolColumn get activated => boolean()();

  TextColumn get accessToken =>
      text().unique().withLength(min: 0, max: 256).nullable()();

  IntColumn get employeeId =>
      integer().nullable().references(Employee, #id)(); // Foreign key

  DateTimeColumn get lastActiveDatetime => dateTime().nullable()();

  BoolColumn get isSystemUser => boolean()();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();
}
