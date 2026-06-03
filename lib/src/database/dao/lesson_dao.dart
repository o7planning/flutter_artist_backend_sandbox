part of '../../../database.dart';

@DriftAccessor(tables: [Lesson])
class LessonDAO extends DatabaseAccessor<SharedDatabase> with _$LessonDAOMixin {
  LessonDAO(super.db);

  Future<LessonData?> findById(int lessonId) async {
    return await (db.select(
      db.lesson,
    )..where((e) => e.id.equals(lessonId))).getSingleOrNull();
  }
}
