import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:grocery_app/modules/Select_Location/select_location%20.dart';
import 'package:grocery_app/modules/sign_in/sign_in_page.dart';
import 'package:grocery_app/modules/verification/verification_page.dart';

class RouteHelper {
  static const String signIn = '/sign-in';
  static const String selectLocation = '/select-location';
  static const String verification = '/verification';

  static String getSignInRoute(String verification) => signIn;
  static String getSelectLocationRoute() => selectLocation;
  static String getVerificationRoute(String verification) => verification;

  GetPage getSignInPage() => GetPage(name: signIn, page: () => SignInPage());

  GetPage getSelectLocationPage() =>
      GetPage(name: selectLocation, page: () => SelectLocation());

  GetPage getVerificationPage() =>
      GetPage(name: verification, page: () => VerificationPage());
}
