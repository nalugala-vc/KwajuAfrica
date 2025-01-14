import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kwajuafrica/api/configs.dart';
import 'package:kwajuafrica/api/endpoints.dart';
import 'package:kwajuafrica/model/brand_variant.dart';
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

  Future<List<BrandVariant>?> fetchBrandVariants({
    required String categoryId,
    required String subCategoryId,
    required String typeId,
    required String brandId,
  }) async {
    final Uri url =
        Uri.parse('${AppConfigs.appBaseUrl}${Endpoints.brandVariants}');
    final headers = await AppConfigs.authorizedHeaders();

    // Add the body parameters
    final body = jsonEncode({
      "category_id": categoryId,
      "sub_category_id": subCategoryId,
      "type_id": typeId,
      "brand_id": brandId,
    });

    try {
      // Create a custom request to support GET with body
      final request = http.Request('GET', url);
      request.headers.addAll(headers);
      request.body = body;

      final streamedResponse = await request
          .send()
          .timeout(const Duration(seconds: AppConfigs.timeoutDuration));

      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> brandVariantsJson = responseData['data'];
        List<BrandVariant> brandVariants = brandVariantsJson
            .map((json) => BrandVariant.fromJson(json))
            .toList();
        return brandVariants;
      } else {
        print('Response: ${response.body}');
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
