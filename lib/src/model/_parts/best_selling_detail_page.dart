part of '../model.dart';

@JsonSerializable()
class BestSellingDetailPage extends PageDataImpl<BestSellingDetail> {
  BestSellingDetailPage({required super.items, required super.paginationInfo});

  factory BestSellingDetailPage.fromJson(Map<String, dynamic> json) =>
      _$BestSellingDetailPageFromJson(json);

  // IMPORTANT:
  Map<String, dynamic> toJson() => _$BestSellingDetailPageToJson(this);
}
