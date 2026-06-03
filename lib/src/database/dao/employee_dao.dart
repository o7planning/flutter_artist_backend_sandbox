part of '../../../database.dart';

@DriftAccessor(tables: [Employee])
class EmployeeDAO extends DatabaseAccessor<SharedDatabase>
    with _$EmployeeDAOMixin {
  EmployeeDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.employee)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<EmployeeData?> findById(int employeeId) async {
    return await (db.select(
      db.employee,
    )..where((e) => e.id.equals(employeeId))).getSingleOrNull();
  }

  Future<List<EmployeeData>> getAll() async {
    return await (db.select(db.employee)).get();
  }

  Future<EmployeeData?> findByEmpNumber(String empNumber) async {
    return await (db.select(
      db.employee,
    )..where((e) => e.empNumber.equals(empNumber))).getSingleOrNull();
  }

  Future<EmployeeData?> findByEmail(String email) async {
    return await (db.select(
      db.employee,
    )..where((e) => e.empNumber.equals(email))).getSingleOrNull();
  }

  Future<int> deleteById(int employeeId) async {
    return await (db.delete(
      db.employee,
    )..where((e) => e.id.equals(employeeId))).go();
  }
}
