import 'package:kwajuafrica/model/products.dart';

class FeaturedProductCategory {
  final String categoryName;
  final List<Product> products;

  FeaturedProductCategory({
    required this.categoryName,
    required this.products,
  });

  factory FeaturedProductCategory.fromJson(Map<String, dynamic> json) {
    return FeaturedProductCategory(
      categoryName: json['category_name'],
      products: (json['products'] as List<dynamic>)
          .map((product) => Product.fromJson(product))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_name': categoryName,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
