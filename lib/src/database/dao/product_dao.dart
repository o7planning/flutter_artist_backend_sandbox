part of '../../../database.dart';

@DriftAccessor(tables: [Product])
class ProductDAO extends DatabaseAccessor<SharedDatabase>
    with _$ProductDAOMixin {
  ProductDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.product)..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<ProductData?> findById(int productId) async {
    return await (db.select(
      db.product,
    )..where((e) => e.id.equals(productId))).getSingleOrNull();
  }

  Future<int> deleteById(int productId) async {
    return await (db.delete(
      db.product,
    )..where((e) => e.id.equals(productId))).go();
  }
}
