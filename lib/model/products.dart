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
