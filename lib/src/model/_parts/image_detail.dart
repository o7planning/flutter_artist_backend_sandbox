part of '../model.dart';

class ImageDetail {
  int id;
  String ext;
  int size;
  int width;
  int height;

  ImageDetail({
    required this.id,
    required this.ext,
    required this.size,
    required this.width,
    required this.height,
  });

  static ImageDetail fromMap(Map<String, dynamic> map) {
    return ImageDetail(
      id: map["id"],
      ext: map["ext"],
      size: map["size"],
      width: map["width"],
      height: map["height"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "ext": ext,
      "size": size,
      "width": width,
      "height": height,
    };
  }
}
