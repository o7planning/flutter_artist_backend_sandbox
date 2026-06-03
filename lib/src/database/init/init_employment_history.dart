part of '../../../database.dart';

Future<void> initEmploymentHistories(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/employment_histories.txt",
  );
  //
  List<CompanyData> companies = await database.select(database.company).get();
  Map<String, int> companyMap = {for (var v in companies) v.code: v.id};
  //
  List<DepartmentData> departments = await database
      .select(database.department)
      .get();
  Map<String, int> departmentMap = {for (var v in departments) v.code: v.id};
  //
  List<EmployeeData> employees = await database.select(database.employee).get();
  Map<String, int> employeeMap = {for (var v in employees) v.empNumber: v.id};
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
    // @line: "EmpNumber; DepartmentCode; CompanyCode; FromDate; ToDate; PositionCode;"
    //
    String empNumber = values[0].trim();
    String deptCode = values[1].trim();
    String companyCode = values[2].trim();
    DateTime fromDate = stringToDate(values[3].trim());
    DateTime toDate = stringToDate(values[4].trim());
    String positionCode = values[5].trim();

    await database
        .into(database.employmentHistory)
        .insert(
          EmploymentHistoryCompanion.insert(
            employeeId: employeeMap[empNumber]!,
            employeePositionId: employeePositionMap[positionCode]!,
            departmentId: departmentMap[deptCode]!,
            companyId: companyMap[companyCode]!,
            fromDate: fromDate,
            toDate: toDate,
          ),
        );
  }
}
