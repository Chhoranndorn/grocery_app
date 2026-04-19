import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grocery_app/controller/auth_controller.dart';
import 'package:grocery_app/core/di/init.dart';
import 'package:grocery_app/data/repository/auth_repo.dart';
import 'package:grocery_app/helper/route_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies(); // Initialize dependencies before running the app
  runApp(const MyApp());
}

Future<void> initDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut<AuthRepo>(() => MockAuthRepo());
  Get.lazyPut<AuthController>(() => AuthController(authRepo: Get.find()));
}

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
