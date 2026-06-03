part of '../../../database.dart';

class EmploymentHistory extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get employeeId => integer().references(Employee, #id)();

  IntColumn get employeePositionId =>
      integer().references(EmployeePosition, #id)();

  IntColumn get departmentId => integer().references(Department, #id)();

  IntColumn get companyId => integer().references(Company, #id)();

  DateTimeColumn get fromDate => dateTime()();

  DateTimeColumn get toDate => dateTime()();
}
