import 'package:kwajuafrica/model/subcategory.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final List<SubCategory> subcategories;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.subcategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      subcategories: (json['subcategories'] as List)
          .map((subJson) => SubCategory.fromJson(subJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'subcategories': subcategories.map((sub) => sub.toJson()).toList(),
    };
  }
}
