part of '../../../database.dart';

class Contributor extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get projectId => integer().references(Project, #id)();

  IntColumn get appUserId => integer().references(AppUser, #id)();
}
