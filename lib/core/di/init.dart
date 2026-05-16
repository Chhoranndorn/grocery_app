import 'package:get/get.dart';
import 'package:grocery_app/data/api/dio_client.dart';
import 'package:grocery_app/data/repository/product_repo.dart';
import 'package:grocery_app/controller/product_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // SharedPreferences
  Get.lazyPut(() => sharedPreferences);

  // ✅ VERY IMPORTANT
  Get.lazyPut(() => DioClient());

  // Repositories
  // Get.lazyPut<AuthRepo>(() => MockAuthRepo());
  Get.lazyPut(() => ProductRepo(dioClient: Get.find()));

  // Controllers
  // Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
}