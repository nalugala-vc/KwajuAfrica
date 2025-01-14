import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kwajuafrica/core/controller/base_controller.dart';
import 'package:kwajuafrica/model/brand_variant.dart';
import 'package:kwajuafrica/repositories/product_repository.dart';

class BrandVariantsController extends BaseController {
  static BrandVariantsController get instance => Get.find();

  final ProductRepository _productRepository = ProductRepository();

  final brandVariantsList = RxList<BrandVariant?>();

  Future<void> fetchBrandVariants({
    required String categoryId,
    required String subCategoryId,
    required String typeId,
    required String brandId,
  }) async {
    setBusy(true);
    try {
      final brandVariants = await _productRepository.fetchBrandVariants(
          brandId: brandId,
          categoryId: categoryId,
          subCategoryId: subCategoryId,
          typeId: typeId);
      setBusy(false);
      if (brandVariants != null && brandVariants.isNotEmpty) {
        brandVariantsList.assignAll(brandVariants);
      } else {
        brandVariantsList.clear();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch brand variants');
    } finally {
      setBusy(false);
    }
  }
}
