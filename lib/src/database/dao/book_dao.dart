part of '../../../database.dart';

@DriftAccessor(tables: [Book])
class BookDAO extends DatabaseAccessor<SharedDatabase> with _$BookDAOMixin {
  BookDAO(super.db);

  Future<BookData?> findById(int bookId) async {
    return await (db.select(
      db.book,
    )..where((e) => e.id.equals(bookId))).getSingleOrNull();
  }

  Future<BookData?> findByCode(String code) async {
    return await (db.select(
      db.book,
    )..where((e) => e.code.equals(code))).getSingleOrNull();
  }
}
