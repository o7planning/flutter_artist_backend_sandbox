part of '../../../database.dart';

class Language extends Table {
  TextColumn get id => text().withLength(min: 1, max: 8).unique()();

  TextColumn get name => text().withLength(min: 1, max: 256)();

  TextColumn get nameInEnglish => text().withLength(min: 1, max: 256)();

  IntColumn get seqNum => integer()();
}
