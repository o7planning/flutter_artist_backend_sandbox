part of '../model.dart';

@JsonSerializable()
class AlbumInfo {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'seqNum')
  int seqNum;

  @JsonKey(name: 'published')
  bool published;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  AlbumInfo(
    this.id,
    this.code,
    this.name,
    this.seqNum,
    this.published,
    this.locked,
  );

  AlbumInfo.named({
    required this.id,
    required this.code,
    required this.name,
    required this.seqNum,
    required this.published,
    required this.locked,
    required this.imagePath,
  });

  factory AlbumInfo.fromEntity(AlbumData entity) {
    return AlbumInfo.named(
      id: entity.id,
      code: entity.code,
      name: entity.name,
      seqNum: entity.seqNum,
      published: entity.published,
      locked: entity.locked,
      imagePath: entity.imagePath,
    );
  }

  factory AlbumInfo.fromJson(Map<String, dynamic> json) =>
      _$AlbumInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumInfoToJson(this);
}
