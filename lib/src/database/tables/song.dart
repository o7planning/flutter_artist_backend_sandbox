part of '../../../database.dart';

class Song extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 255)();

  BoolColumn get locked => boolean()();

  BoolColumn get published => boolean()();

  TextColumn get imagePath => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get description =>
      text().withLength(min: 0, max: 256).nullable()();

  TextColumn get note => text().withLength(min: 0, max: 256).nullable()();

  TextColumn get youtubeCode => text().withLength(min: 0, max: 64).nullable()();

  TextColumn get youtubeVideoInfo =>
      text().withLength(min: 0, max: 1024).nullable()();

  IntColumn get albumId => integer().references(Album, #id)(); // Foreign key
}
