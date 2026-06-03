part of '../../../database.dart';

@DriftAccessor(tables: [Contributor])
class ContributorDAO extends DatabaseAccessor<SharedDatabase>
    with _$ContributorDAOMixin {
  ContributorDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.contributor)
      ..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<List<ContributorData>> listByProjectId(int projectId) async {
    return await (db.select(
      db.contributor,
    )..where((e) => e.projectId.equals(projectId))).get();
  }

  Future<ContributorData?> findById(int contributorId) async {
    return await (db.select(
      db.contributor,
    )..where((e) => e.id.equals(contributorId))).getSingleOrNull();
  }

  Future<int> deleteById(int contributorId) async {
    return await (db.delete(
      db.contributor,
    )..where((e) => e.id.equals(contributorId))).go();
  }

  Future<void> addMultiContributors(int projectId) async {
    final ProjectData? project = await db.projectDAO.findById(projectId);
    if (project == null) {
      return;
    }
    final List<ContributorData> contributors = await db.contributorDAO
        .listByProjectId(projectId);
    final List<int> appUserIds = contributors.map((c) => c.appUserId).toList();

    final List<AppUserData> appAppUsers = await db.appUserDAO.listAll();
    final List<AppUserData> availableAppUsers = appAppUsers
        .where((u) => !appUserIds.contains(u.id))
        .toList();
    //
    int i = 0;
    for (var appUser in availableAppUsers) {
      if (i++ >= 2) {
        break;
      }
      await db
          .into(db.contributor)
          .insert(
            ContributorCompanion.insert(
              projectId: projectId,
              appUserId: appUser.id,
            ),
          );
    }
  }
}
