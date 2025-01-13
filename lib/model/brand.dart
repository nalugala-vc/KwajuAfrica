class Brand {
  final String brandId;
  final String name;
  final String image;

  Brand({
    required this.brandId,
    required this.name,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      brandId: json['brand_id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand_id': brandId,
      'name': name,
      'image': image,
    };
  }
}
