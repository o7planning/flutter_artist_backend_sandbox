part of '../../../database.dart';

class TeacherPosition extends Table {
  TextColumn get id => text().withLength(min: 1, max: 16).unique()();

  TextColumn get name => text().withLength(min: 1, max: 256)();
}
