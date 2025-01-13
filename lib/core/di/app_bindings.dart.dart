import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:kwajuafrica/controllers/products_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}
