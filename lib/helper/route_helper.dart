import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:grocery_app/bindings/login_binding.dart';
import 'package:grocery_app/modules/Home/home_page.dart';
import 'package:grocery_app/modules/Login/login_page.dart';
import 'package:grocery_app/modules/SelectLocation/select_location%20.dart';
import 'package:grocery_app/modules/Signin/sign_in_page.dart';
import 'package:grocery_app/modules/Signup/signup_page.dart';
import 'package:grocery_app/modules/Splash/splash_page.dart';
import 'package:grocery_app/modules/Verification/verification_page.dart';

class RouteHelper {
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String loginPage = '/login';
  static const String home = '/home';
  static const String selectLocation = '/select-location';
  static const String verification = '/verification';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: signIn, page: () => SignInPage()),
    GetPage(name: signUp, page: () => SignupPage()),
    GetPage(name: loginPage, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: selectLocation, page: () => SelectLocation()),
    GetPage(name: verification, page: () => VerificationPage()),
  ];
}
