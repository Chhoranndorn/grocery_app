import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:grocery_app/controller/product_controller.dart';

class ProductBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ProductController(productRepo: Get.find()));
  }

}