import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kwajuafrica/api/configs.dart';
import 'package:kwajuafrica/api/endpoints.dart';
import 'package:kwajuafrica/model/category.dart';
import 'package:kwajuafrica/model/featured_product_category.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<FeaturedProductCategory>?> fetchFeaturedProducts() async {
    final Uri url =
        Uri.parse('${AppConfigs.appBaseUrl}${Endpoints.featuredProducts}');

    final headers = await AppConfigs.authorizedHeaders();

    try {
      final response = await http
          .get(
            url,
            headers: headers,
          )
          .timeout(const Duration(seconds: AppConfigs.timeoutDuration));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        final List<dynamic> categoriesJson = responseData['data'];

        List<FeaturedProductCategory> featuredProducts = categoriesJson
            .map((json) => FeaturedProductCategory.fromJson(json))
            .toList();

        return featuredProducts;
      } else {
        print(response.body);
        Get.snackbar('Error', 'Something went wrong');
        return null;
      }
    } on SocketException {
      Get.snackbar('Error', 'No Internet connection');
      return null;
    } on TimeoutException {
      Get.snackbar('Error', 'Request timed out');
      return null;
    } catch (e) {
      print('Error: Something went wrong $e');
      return null;
    }
  }

  Future<List<CategoryModel>?> fetchCategories() async {
    final Uri url =
        Uri.parse('${AppConfigs.appBaseUrl}${Endpoints.categories}');
    final headers = await AppConfigs.authorizedHeaders();

    try {
      final response = await http
          .get(
            url,
            headers: headers,
          )
          .timeout(const Duration(seconds: AppConfigs.timeoutDuration));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        final List<dynamic> categoriesJson = responseData['data'];

        List<CategoryModel> categories =
            categoriesJson.map((json) => CategoryModel.fromJson(json)).toList();

        return categories;
      } else {
        print('response ${response.body}');
        Get.snackbar('Error', 'Something went wrong');
        return null;
      }
    } on SocketException {
      Get.snackbar('Error', 'No Internet connection');
      return null;
    } on TimeoutException {
      Get.snackbar('Error', 'Request timed out');
      return null;
    } catch (e) {
      print('Error: Something went wrong $e');
      return null;
    }
  }
}
