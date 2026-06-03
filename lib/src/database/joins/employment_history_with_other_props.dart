import '../../../database.dart';

class EmploymentHistoryWithOtherProps {
  final EmploymentHistoryData employmentHistory;
  final EmployeeData employee;
  final CompanyData company;
  final DepartmentData department;
  final EmployeePositionData employeePosition;

  EmploymentHistoryWithOtherProps(
    this.employmentHistory,
    this.employee,
    this.company,
    this.department,
    this.employeePosition,
  );
}
