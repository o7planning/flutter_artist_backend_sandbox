part of '../model.dart';

@JsonSerializable()
class NotificationMessageDetailPage
    extends PageDataImpl<NotificationMessageDetail> {
  NotificationMessageDetailPage({
    required super.items,
    required super.paginationInfo,
  });

  factory NotificationMessageDetailPage.fromJson(Map<String, dynamic> json) =>
      _$NotificationMessageDetailPageFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationMessageDetailPageToJson(this);
}
