part of '../model.dart';

@JsonSerializable()
class BookDetail {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'seqNum')
  int seqNum;

  @JsonKey(name: 'published')
  bool published;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  BookDetail(
    this.id,
    this.code,
    this.title,
    this.seqNum,
    this.published,
    this.locked,
  );

  BookDetail.named({
    required this.id,
    required this.code,
    required this.title,
    required this.seqNum,
    required this.published,
    required this.locked,
    this.imagePath,
    this.description,
    this.note,
  });

  BookInfo toBookInfo() {
    return BookInfo.named(
      id: id,
      code: code,
      title: title,
      seqNum: seqNum,
      published: published,
      locked: locked,
      imagePath: imagePath,
    );
  }

  factory BookDetail.fromJson(Map<String, dynamic> json) =>
      _$BookDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $title)";
  }
}
