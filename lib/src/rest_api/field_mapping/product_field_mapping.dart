import '../../../database.dart';

class ProductFieldMapping {
  static fieldToColumnMap(SharedDatabase db) => {
    'productId': db.product.id,
    'productName': db.product.name,
    'searchText': db.product.name, // searchText maps to product name
    'price': db.product.price,
    'active': db.product.active,
    'categoryId': db.product.categoryId,
    'taxRate': db.product.taxRate,
    'estimatedInputPrice': db.product.estimatedInputPrice,
    // Mapping Category fields if joined
    'categoryName': db.category.name,
    'categoryCode': db.category.code,
  };
}
