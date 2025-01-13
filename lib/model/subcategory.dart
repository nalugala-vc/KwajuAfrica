import 'package:kwajuafrica/model/type.dart';

class SubCategory {
  final String subCategoryId;
  final String name;
  final List<Type> types;

  SubCategory({
    required this.subCategoryId,
    required this.name,
    required this.types,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      subCategoryId: json['sub_category_id'],
      name: json['name'],
      types: (json['types'] as List)
          .map((typeJson) => Type.fromJson(typeJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sub_category_id': subCategoryId,
      'name': name,
      'types': types.map((type) => type.toJson()).toList(),
    };
  }
}
