part of '../../../database.dart';

@DriftAccessor(tables: [Customer])
class CustomerDAO extends DatabaseAccessor<SharedDatabase>
    with _$CustomerDAOMixin {
  CustomerDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.customer)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<CustomerData?> findById(int customerId) async {
    return await (db.select(
      db.customer,
    )..where((e) => e.id.equals(customerId))).getSingleOrNull();
  }

  Future<CustomerData?> findByCode(String code) async {
    return await (db.select(
      db.customer,
    )..where((e) => e.code.equals(code))).getSingleOrNull();
  }

  Future<CustomerData?> findByEmail(String email) async {
    return await (db.select(
      db.customer,
    )..where((e) => e.code.equals(email))).getSingleOrNull();
  }
}
