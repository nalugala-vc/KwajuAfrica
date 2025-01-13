import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kwajuafrica/core/controller/base_controller.dart';
import 'package:kwajuafrica/model/featured_product_category.dart';
import 'package:kwajuafrica/repositories/product_repository.dart';

class ProductsController extends BaseController {
  static ProductsController get instance => Get.find();

  final ProductRepository _productRepository = ProductRepository();

  final categories = RxList<FeaturedProductCategory>();

  Future<void> fetchFeaturedProducts() async {
    setBusy(true);
    try {
      final featuredCategories =
          await _productRepository.fetchFeaturedProducts();
      setBusy(false);
      if (featuredCategories != null && featuredCategories.isNotEmpty) {
        categories.assignAll(featuredCategories);
      } else {
        categories.clear();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products');
    } finally {
      setBusy(false);
    }
  }
}
