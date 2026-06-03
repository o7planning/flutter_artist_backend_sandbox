part of '../model.dart';

@JsonSerializable()
class SystemLogInfo {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'createDateTime')
  late String createDateTime;

  @JsonKey(name: 'severity')
  late String severity;

  @JsonKey(name: 'content')
  late String content;

  SystemLogInfo(this.id, this.createDateTime, this.severity, this.content);

  SystemLogInfo.named({
    required this.id,
    required this.createDateTime,
    required this.severity,
    required this.content,
  });

  factory SystemLogInfo.fromEntity(SystemLogData entity) {
    return SystemLogInfo.named(
      id: entity.id,
      createDateTime: dateTimeToString(entity.createDateTime),
      severity: entity.severity,
      content: entity.content,
    );
  }

  factory SystemLogInfo.fromJson(Map<String, dynamic> json) =>
      _$SystemLogInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogInfoToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $content)";
  }
}
