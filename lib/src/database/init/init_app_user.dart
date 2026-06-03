part of '../../../database.dart';

Future<void> initAppUsers(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/app_users.txt",
  );
  //
  List<EmployeeData> employees = await database.select(database.employee).get();
  Map<String, int> employeeMap = {for (var v in employees) v.empNumber: v.id};
  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "UserName,Email,FullName,ImageName,Role,Password,EmpNumber".
    //
    String userName = values[0].trim();
    // bool isSystemUser = bool.parse(values[1].trim());
    String email = values[2].trim();
    String fullName = values[3].trim();
    String imageName = values[4].trim();
    // String role = values[5].trim();
    String password = values[6].trim();
    String employeeNumber = values[7].trim();
    String encryptedPassword = password; // passwordEncoder.encode(password)

    await database
        .into(database.appUser)
        .insert(
          AppUserCompanion.insert(
            userName: userName,
            email: email,
            fullName: fullName,
            encryptedPassword: encryptedPassword,
            enabled: true,
            activated: true,
            accessToken: const Value.absent(),
            employeeId: Value.absentIfNull(employeeMap[employeeNumber]),
            lastActiveDatetime: const Value.absent(),
            isSystemUser: true,
            imagePath: Value("/static/images/app-user/$imageName"),
          ),
        );
  }
}
