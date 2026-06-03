part of '../model.dart';

@JsonSerializable()
class ProductDetail {
  @JsonKey(name: 'id')
  late int id;

  @JsonKey(name: 'name')
  late String name;

  @JsonKey(name: 'price')
  late double price;

  @JsonKey(name: 'active')
  late bool active;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'category')
  CategoryInfo category;

  @JsonKey(name: 'estimatedInputPrice')
  late double estimatedInputPrice;

  @JsonKey(name: 'taxRate')
  late double taxRate;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(includeFromJson: false)
  String? get imageUrl {
    return getStaticResourceURL(imagePath);
  }

  ProductDetail(
    this.id,
    this.name,
    this.category,
    this.price,
    this.active,
    this.imagePath,
    this.estimatedInputPrice,
    this.taxRate,
    this.description,
  );

  ProductDetail.named({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.active,
    required this.imagePath,
    required this.estimatedInputPrice,
    required this.taxRate,
    required this.description,
  });

  factory ProductDetail.fromEntity(ProductData entity, CategoryData category) {
    CategoryInfo categoryInfo = CategoryInfo.fromEntity(category);

    return ProductDetail.named(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      active: entity.active,
      imagePath: getProductBase64Image(entity.id) ?? entity.imagePath,
      category: categoryInfo,
      estimatedInputPrice: entity.estimatedInputPrice,
      taxRate: entity.taxRate,
      description: entity.description,
    );
  }

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);

  @override
  String toString() {
    return "${getClassName(this)}($id, $name)";
  }
}
