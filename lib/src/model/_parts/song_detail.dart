part of '../model.dart';

@JsonSerializable()
class SongDetail {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'published')
  bool published;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'youtubeCode')
  String? youtubeCode;

  @JsonKey(name: 'youtubeVideoInfo')
  String? youtubeVideoInfo;

  @JsonKey(name: 'album')
  AlbumInfo album;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  SongDetail(this.id, this.name, this.locked, this.published, this.album);

  SongDetail.named({
    required this.id,
    required this.name,
    required this.locked,
    required this.published,
    required this.album,
    this.imagePath,
    this.description,
    this.note,
    this.youtubeCode,
    this.youtubeVideoInfo,
  });

  factory SongDetail.fromEntity(SongData entity, AlbumData album) {
    return SongDetail.named(
      id: entity.id,
      name: entity.name,
      locked: entity.locked,
      published: entity.published,
      album: AlbumInfo.fromEntity(album),
      imagePath: entity.imagePath,
      description: entity.description,
      note: entity.note,
      youtubeCode: entity.youtubeCode,
      youtubeVideoInfo: entity.youtubeVideoInfo,
    );
  }

  SongInfo toSongInfo() {
    return SongInfo.named(
      id: id,
      name: name,
      albumId: album.id,
      locked: locked,
      published: published,
      imagePath: imagePath,
    );
  }

  factory SongDetail.fromJson(Map<String, dynamic> json) =>
      _$SongDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SongDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
