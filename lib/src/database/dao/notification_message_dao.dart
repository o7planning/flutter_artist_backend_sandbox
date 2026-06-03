part of '../../../database.dart';

@DriftAccessor(tables: [NotificationMessage])
class NotificationMessageDAO extends DatabaseAccessor<SharedDatabase>
    with _$NotificationMessageDAOMixin {
  NotificationMessageDAO(super.db);

  Future<NotificationMessageData?> findById(int notificationMessageId) async {
    return await (db.select(
      db.notificationMessage,
    )..where((e) => e.id.equals(notificationMessageId))).getSingleOrNull();
  }
}
