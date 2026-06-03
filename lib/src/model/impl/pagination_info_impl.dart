part of '../model.dart';

@JsonSerializable()
class PaginationInfoImpl implements PaginationInfo {
  @override
  @JsonKey(name: 'currentPage')
  int currentPage;
  @override
  @JsonKey(name: 'pageSize')
  int pageSize;
  @override
  @JsonKey(name: 'totalItems')
  int totalItems;
  @override
  @JsonKey(name: 'totalPages')
  int totalPages;

  PaginationInfoImpl({
    required this.currentPage,
    required this.pageSize,
    required this.totalItems,
    required this.totalPages,
  });

  static PaginationInfoImpl? fromPagination(PaginationInfo? pagination) {
    if (pagination == null) {
      return null;
    }
    return PaginationInfoImpl(
      currentPage: pagination.currentPage,
      pageSize: pagination.pageSize,
      totalItems: pagination.totalItems,
      totalPages: pagination.totalPages,
    );
  }

  factory PaginationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoImplFromJson(json);

  // IMPORTANT:
  Map<String, dynamic> toJson() => _$PaginationInfoImplToJson(this);
}
