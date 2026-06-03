part of '../model.dart';

@JsonSerializable()
class LanguageDetail {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'nameInEnglish')
  String nameInEnglish;

  @JsonKey(name: 'seqNum')
  int seqNum;

  LanguageDetail(this.id, this.name, this.nameInEnglish, this.seqNum);

  LanguageDetail.named({
    required this.id,
    required this.name,
    required this.nameInEnglish,
    required this.seqNum,
  });

  LanguageInfo toLanguageInfo() {
    return LanguageInfo.named(
      id: id,
      name: name,
      nameInEnglish: nameInEnglish,
      seqNum: seqNum,
    );
  }

  factory LanguageDetail.fromJson(Map<String, dynamic> json) =>
      _$LanguageDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
