part of '../model.dart';

@JsonSerializable()
class TeacherDetail {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'fullName')
  String fullName;

  @JsonKey(name: 'birthday')
  String birthday;

  @JsonKey(name: 'gender')
  GenderInfo gender;

  @JsonKey(name: 'position')
  TeacherPositionInfo position;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'universityId')
  int universityId;

  @JsonKey(name: 'country')
  CountryInfo? country;

  @JsonKey(name: 'youtubeVideoCode')
  String? youtubeVideoCode;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'skype')
  String? skype;

  @JsonKey(name: 'facebook')
  String? facebook;

  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  TeacherDetail(
    this.id,
    this.fullName,
    this.birthday,
    this.gender,
    this.position,
    this.email,
    this.locked,
    this.active,
    this.universityId,
  );

  TeacherDetail.named({
    required this.id,
    required this.fullName,
    required this.birthday,
    required this.gender,
    required this.position,
    required this.email,
    required this.locked,
    required this.active,
    required this.universityId,
    this.imagePath,
    this.description,
    this.note,
    this.youtubeVideoCode,
    this.skype,
    this.facebook,
    this.phoneNumber,
  });

  factory TeacherDetail.fromEntity(
    TeacherData entity,
    GenderData gender,
    TeacherPositionData teacherPosition,
  ) {
    return TeacherDetail.named(
      id: entity.id,
      fullName: entity.fullName,
      birthday: dateTimeToString(entity.birthday),
      gender: GenderInfo.fromEntity(gender),
      position: TeacherPositionInfo.fromEntity(teacherPosition),
      email: entity.email,
      locked: entity.locked,
      active: entity.active,
      universityId: entity.universityId,
      imagePath: entity.imagePath,
      description: entity.description,
      note: entity.note,
      youtubeVideoCode: entity.youtubeVideoCode,
      skype: entity.skype,
      facebook: entity.facebook,
      phoneNumber: entity.phoneNumber,
    );
  }

  TeacherInfo toTeacherInfo() {
    return TeacherInfo.named(
      id: id,
      fullName: fullName,
      birthday: birthday,
      gender: gender,
      position: position,
      locked: locked,
      active: active,
      imagePath: imagePath,
    );
  }

  factory TeacherDetail.fromJson(Map<String, dynamic> json) =>
      _$TeacherDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $fullName)";
  }
}
