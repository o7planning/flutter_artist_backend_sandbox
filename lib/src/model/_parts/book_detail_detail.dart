part of '../model.dart';

@JsonSerializable()
class BookDetailDetail extends BookDetail {
  @JsonKey(name: 'lessons', defaultValue: [])
  List<LessonDetail> lessons = [];

  BookDetailDetail(
    super.id,
    super.code,
    super.title,
    super.seqNum,
    super.published,
    super.locked,
  );

  factory BookDetailDetail.fromJson(Map<String, dynamic> json) =>
      _$BookDetailDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailDetailToJson(this);
}
