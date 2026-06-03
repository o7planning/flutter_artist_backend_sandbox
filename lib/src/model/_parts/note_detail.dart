part of '../model.dart';

@JsonSerializable()
class NoteDetail {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'createDateTime')
  String createDateTime;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'colorCode')
  String colorCode;

  NoteDetail(
    this.id,
    this.title,
    this.createDateTime,
    this.content,
    this.colorCode,
  );

  NoteDetail.named({
    required this.id,
    required this.title,
    required this.createDateTime,
    required this.content,
    required this.colorCode,
  });

  factory NoteDetail.fromEntity(NoteData entity) {
    return NoteDetail.named(
      id: entity.id,
      title: entity.title,
      createDateTime: dateTimeToString(entity.createDateTime),
      content: entity.content,
      colorCode: entity.colorCode,
    );
  }

  NoteInfo toNoteInfo() {
    return NoteInfo.named(
      id: id,
      title: title,
      createDateTime: createDateTime,
      content: content,
      colorCode: colorCode,
    );
  }

  factory NoteDetail.fromJson(Map<String, dynamic> json) =>
      _$NoteDetailFromJson(json);

  Map<String, dynamic> toJson() => _$NoteDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $title)";
  }
}
