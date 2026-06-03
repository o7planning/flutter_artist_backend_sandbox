part of '../model.dart';

abstract class PageDataImpl<I extends Object> extends PageData<I> {
  @override
  @JsonKey(name: 'pagination')
  PaginationInfoImpl? paginationInfo;
  @override
  @JsonKey(name: 'items', defaultValue: [])
  List<I> items = [];

  PageDataImpl({required this.paginationInfo, required this.items});
}
