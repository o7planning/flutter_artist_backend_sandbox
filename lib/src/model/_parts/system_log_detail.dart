part of '../model.dart';

@JsonSerializable()
class SystemLogDetail {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'createDateTime')
  late String createDateTime;

  @JsonKey(name: 'severity')
  late String severity;

  @JsonKey(name: 'content')
  late String content;

  SystemLogDetail(this.id, this.createDateTime, this.severity, this.content);

  SystemLogDetail.named({
    required this.id,
    required this.createDateTime,
    required this.severity,
    required this.content,
  });

  factory SystemLogDetail.fromEntity(SystemLogData entity) {
    return SystemLogDetail.named(
      id: entity.id,
      createDateTime: dateTimeToString(entity.createDateTime),
      severity: entity.severity,
      content: entity.content,
    );
  }

  SystemLogInfo toSystemLogInfo() {
    return SystemLogInfo.named(
      id: id,
      createDateTime: createDateTime,
      severity: severity,
      content: content,
    );
  }

  factory SystemLogDetail.fromJson(Map<String, dynamic> json) =>
      _$SystemLogDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SystemLogDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $content)";
  }
}
