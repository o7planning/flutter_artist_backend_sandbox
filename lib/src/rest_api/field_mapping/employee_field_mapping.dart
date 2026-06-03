import '../../../database.dart';

class EmployeeFieldMapping {
  static fieldToColumnMap(SharedDatabase db) => {
    'id': db.employee.id,
    'empNumber': db.employee.empNumber,
    'name': db.employee.name,
    'email': db.employee.email,
    'departmentId': db.employee.departmentId,
    'companyId': db.company.id,
    'searchText': db.employee.name,
    'birthday': db.employee.birthday,
    'hireDate': db.employee.hireDate,
  };
}
