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

class Product {
  final String categoryId;
  final String subCategoryId;
  final String typeId;
  final String brandId;
  final String typeName;
  final String image;

  Product({
    required this.categoryId,
    required this.subCategoryId,
    required this.typeId,
    required this.brandId,
    required this.typeName,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      typeId: json['type_id'],
      brandId: json['brand_id'],
      typeName: json['type_name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'sub_category_id': subCategoryId,
      'type_id': typeId,
      'brand_id': brandId,
      'type_name': typeName,
      'image': image,
    };
  }
}
