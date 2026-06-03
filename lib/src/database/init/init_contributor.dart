part of '../../../database.dart';

Future<void> initContributors(SharedDatabase database) async {
  String content = await AssetsUtils.loadTextAsset(
    "statics/init-data/contributors.txt",
  );

  List<ProjectData> projects = await database.select(database.project).get();
  Map<String, int> projectMap = {for (var v in projects) v.code: v.id};

  List<AppUserData> appUsers = await database.select(database.appUser).get();
  Map<String, int> appUserMap = {for (var v in appUsers) v.userName: v.id};

  //
  List<String> lines = content.split("\n");
  for (String li in lines) {
    String line = li.trim();
    if (line.startsWith("#") || line.isEmpty) {
      continue;
    }
    List<String> values = line.split(";");
    //
    // @line: "ProjectCode;UserName"
    //
    String projectCode = values[0].trim();
    String userName = values[1].trim();

    await database
        .into(database.contributor)
        .insert(
          ContributorCompanion.insert(
            projectId: projectMap[projectCode]!,
            appUserId: appUserMap[userName]!,
          ),
        );
  }
}
