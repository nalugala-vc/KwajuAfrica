import 'package:kwajuafrica/model/brand.dart';

class Type {
  final String typeId;
  final String name;
  final List<Brand> brands;

  Type({
    required this.typeId,
    required this.name,
    required this.brands,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      typeId: json['type_id'],
      name: json['name'],
      brands: (json['brands'] as List)
          .map((brandJson) => Brand.fromJson(brandJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type_id': typeId,
      'name': name,
      'brands': brands.map((brand) => brand.toJson()).toList(),
    };
  }
}
