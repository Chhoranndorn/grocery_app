import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:grocery_app/controller/auth_controller.dart';
import 'package:grocery_app/controller/signup_controller.dart';
import 'package:grocery_app/core/di/init.dart';
import 'package:grocery_app/data/repository/auth_repo.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepo>(() => MockAuthRepo());
    Get.lazyPut<AuthController>(() => AuthController(authRepo: Get.find()));
    Get.lazyPut<SignupController>(
      () => SignupController(authController: Get.find()),
    );
  }
}
