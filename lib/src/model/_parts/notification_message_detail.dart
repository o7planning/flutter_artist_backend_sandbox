part of '../model.dart';

@JsonSerializable()
class NotificationMessageDetail {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'title')
  late String title;

  @JsonKey(name: 'createDateTime')
  late String createDateTime;

  @JsonKey(name: 'read')
  late bool read;

  @JsonKey(name: 'type')
  late String type;

  @JsonKey(name: 'message')
  late String message;

  NotificationMessageDetail({
    required this.id,
    required this.title,
    required this.createDateTime,
    required this.read,
    required this.type,
    required this.message,
  });

  factory NotificationMessageDetail.fromJson(Map<String, dynamic> json) =>
      _$NotificationMessageDetailFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationMessageDetailToJson(this);
}
