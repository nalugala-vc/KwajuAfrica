import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kwajuafrica/core/controller/base_controller.dart';
import 'package:kwajuafrica/model/brand_variant.dart';
import 'package:kwajuafrica/model/category.dart';
import 'package:kwajuafrica/model/featured_product_category.dart';
import 'package:kwajuafrica/repositories/product_repository.dart';

class BrandVariantsController extends BaseController {
  static BrandVariantsController get instance => Get.find();

  final ProductRepository _productRepository = ProductRepository();

  final brandVariantsLust = RxList<BrandVariant>();
}
