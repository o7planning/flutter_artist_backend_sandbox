part of '../../../database.dart';

@DriftAccessor(tables: [AppUser])
class AppUserDAO extends DatabaseAccessor<SharedDatabase>
    with _$AppUserDAOMixin {
  AppUserDAO(super.db);

  Future<int> getCountAll() async {
    final totalCountExpression = countAll();
    final query = db.selectOnly(db.appUser)..addColumns([totalCountExpression]);
    final row = await query.getSingle();
    return row.read(totalCountExpression) ?? 0;
  }

  Future<List<AppUserData>> listAll() async {
    return await db.select(db.appUser).get();
  }

  Future<AppUserData?> findById(int appUserId) async {
    return await (db.select(
      db.appUser,
    )..where((e) => e.id.equals(appUserId))).getSingleOrNull();
  }

  Future<AppUserData?> findByUserName(String userName) async {
    return await (db.select(
      db.appUser,
    )..where((e) => e.userName.equals(userName))).getSingleOrNull();
  }

  Future<AppUserData?> findByEmail(String email) async {
    return await (db.select(
      db.appUser,
    )..where((e) => e.userName.equals(email))).getSingleOrNull();
  }
}
