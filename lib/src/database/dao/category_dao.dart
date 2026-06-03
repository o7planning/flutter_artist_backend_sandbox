part of '../../../database.dart';

@DriftAccessor(tables: [Category])
class CategoryDAO extends DatabaseAccessor<SharedDatabase>
    with _$CategoryDAOMixin {
  CategoryDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.category)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<CategoryData?> findById(int categoryId) async {
    return await (db.select(
      db.category,
    )..where((e) => e.id.equals(categoryId))).getSingleOrNull();
  }

  Future<CategoryData?> findByCode(String code) async {
    return await (db.select(
      db.category,
    )..where((e) => e.code.equals(code))).getSingleOrNull();
  }
}
