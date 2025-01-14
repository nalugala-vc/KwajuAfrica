import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kwajuafrica/core/controller/base_controller.dart';
import 'package:kwajuafrica/model/category.dart';
import 'package:kwajuafrica/model/featured_product_category.dart';
import 'package:kwajuafrica/repositories/product_repository.dart';

class ProductsController extends BaseController {
  static ProductsController get instance => Get.find();

  final ProductRepository _productRepository = ProductRepository();

  final featuredCategoriesList = RxList<FeaturedProductCategory>();
  final categoriesList = RxList<CategoryModel>();

  Future<void> fetchFeaturedProducts() async {
    setBusy(true);
    try {
      final featuredCategories =
          await _productRepository.fetchFeaturedProducts();

      if (featuredCategories != null && featuredCategories.isNotEmpty) {
        featuredCategoriesList.assignAll(featuredCategories);
      } else {
        featuredCategoriesList.clear();
      }
      setBusy(false);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products');
    } finally {
      setBusy(false);
    }
  }

  Future<void> fetchCategories() async {
    setBusy(true);
    try {
      final categories = await _productRepository.fetchCategories();

      if (categories != null && categories.isNotEmpty) {
        // Explicitly cast to List<Category> to avoid type issues
        categoriesList.assignAll(categories);
      } else {
        categoriesList.clear();
      }
      setBusy(false);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch categories');
    } finally {
      setBusy(false);
    }
  }
}
