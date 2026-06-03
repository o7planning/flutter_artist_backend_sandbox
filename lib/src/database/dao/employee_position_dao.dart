part of '../../../database.dart';

@DriftAccessor(tables: [EmployeePosition])
class EmployeePositionDAO extends DatabaseAccessor<SharedDatabase>
    with _$EmployeePositionDAOMixin {
  EmployeePositionDAO(super.db);

  Future<EmployeePositionData?> findById(int employeePositionId) async {
    return await (db.select(
      db.employeePosition,
    )..where((e) => e.id.equals(employeePositionId))).getSingleOrNull();
  }

  Future<EmployeePositionData?> findByCode(String code) async {
    return await (db.select(
      db.employeePosition,
    )..where((e) => e.code.equals(code))).getSingleOrNull();
  }
}
