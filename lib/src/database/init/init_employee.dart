part of '../../../database.dart';

Future<void> initEmployees(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/employees.txt",
  );

  List<CompanyData> companies = await database.select(database.company).get();
  Map<String, int> companyMap = {for (var v in companies) v.code: v.id};
  //
  List<DepartmentData> departments = await database
      .select(database.department)
      .get();
  Map<String, int> departmentsMap = {for (var v in departments) v.code: v.id};
  //
  List<EmployeePositionData> employeePositions = await database
      .select(database.employeePosition)
      .get();
  Map<String, int> employeePositionMap = {
    for (var v in employeePositions) v.code: v.id,
  };
  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "EmpNumber,DepartmentCode,  EmployeeName, Image, Email, BirthDay, HireDate"
    //
    String empNumber = values[0].trim();
    String positionCode = values[1].trim();
    String deptCode = values[2].trim();
    String name = values[3].trim();
    String imageName = values[4].trim();
    String email = values[5].trim();
    DateTime birthday = stringToDate(values[6].trim());
    DateTime hireDate = stringToDate(values[7].trim());
    //
    await database
        .into(database.employee)
        .insert(
          EmployeeCompanion.insert(
            empNumber: empNumber,
            name: name,
            email: email,
            departmentId: departmentsMap[deptCode]!,
            employeePositionId: employeePositionMap[positionCode]!,
            birthday: birthday,
            hireDate: hireDate,
            imagePath: Value("/static/images/employee/$imageName"),
            address: const Value.absent(),
          ),
        );
  }
}
