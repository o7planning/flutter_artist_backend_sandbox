part of '../../../database.dart';

class Teacher extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get fullName => text().withLength(min: 1, max: 255)();

  DateTimeColumn get birthday => dateTime()();

  TextColumn get genderId => text().references(Gender, #id)(); // Foreign key

  TextColumn get teacherPositionId =>
      text().withLength(min: 1, max: 16).references(TeacherPosition, #id)();

  BoolColumn get locked => boolean()();

  BoolColumn get active => boolean()();

  IntColumn get universityId => integer().references(University, #id)();

  TextColumn get countryId => text().references(Country, #id).nullable()();

  TextColumn get youtubeVideoCode =>
      text().withLength(min: 1, max: 64).nullable()();

  TextColumn get email => text().unique().withLength(min: 1, max: 255)();

  TextColumn get skype => text().withLength(min: 0, max: 255).nullable()();

  TextColumn get facebook => text().withLength(min: 0, max: 255).nullable()();

  TextColumn get phoneNumber =>
      text().withLength(min: 0, max: 255).nullable()();

  TextColumn get description =>
      text().withLength(min: 0, max: 255).nullable()();

  TextColumn get note => text().withLength(min: 0, max: 255).nullable()();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();
}
