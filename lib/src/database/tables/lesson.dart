part of '../../../database.dart';

class Lesson extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 255)();

  TextColumn get titleInEnglish => text().withLength(min: 0, max: 255)();

  IntColumn get seqNum => integer()();

  BoolColumn get locked => boolean()();

  BoolColumn get published => boolean()();

  DateTimeColumn get publishDate => dateTime().nullable()();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();

  IntColumn get bookId => integer().references(Book, #id)();

  TextColumn get description =>
      text().withLength(min: 0, max: 256).nullable()();

  TextColumn get note => text().withLength(min: 0, max: 256).nullable()();
}
