class BrandVariant {
  final String brandId;
  final String name;
  final String image;
  final String sku;
  final String price;
  final String savings;
  final int availableUnits;

  BrandVariant(
      {required this.brandId,
      required this.name,
      required this.image,
      required this.availableUnits,
      required this.price,
      required this.savings,
      required this.sku});

  factory BrandVariant.fromJson(Map<String, dynamic> json) {
    return BrandVariant(
      brandId: json['brand_variant_id'],
      name: json['brand_variant_name'],
      image: json['image'],
      availableUnits: json['available_units'],
      price: json['price'],
      savings: json['savings'],
      sku: json['sku'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand_variant_id': brandId,
      'brand_variant_name': name,
      'image': image,
      'available_units': availableUnits,
      'price': price,
      'savings': savings,
      'sku': sku
    };
  }
}
