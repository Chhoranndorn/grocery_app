import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grocery_app/core/di/init.dart';
import 'package:grocery_app/helper/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initDependencies(); 
  await init();// Initialize dependencies before running the app
  runApp(const MyApp());
}

// Future<void> initDependencies() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   Get.lazyPut(() => sharedPreferences);
//   Get.lazyPut<AuthRepo>(() => MockAuthRepo());
//   Get.lazyPut<AuthController>(() => AuthController(authRepo: Get.find()));
//   Get.lazyPut<ProductRepo>(() => ProductRepo(dioClient: Get.find()));
//   Get.lazyPut<ProductController>(() => ProductController(productRepo: Get.find()));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: RouteHelper.routes,
      // initialRoute: RouteHelper.splash,
      initialRoute: RouteHelper.dashboard,
      theme: ThemeData(fontFamily: "Poppins"),
    );
  }
}
