import 'package:grocery_app/data/models/language_model.dart';

class AppConstants {
  static const String appName = 'Grocery App';
  static const String appVersion = '1.0.0';
  // static const String baseUrl = "https://mock.api.com";
  // static const String baseUrl = "https://grocery-system-api-production.up.railway.app/api";
  static const String baseUrl = "http://10.0.2.2:8000";
  static const String getProductsUri = "/api/products";
  static const String getBannersUri = "/api/banners";
  static const String getCategoriesUri = "/api/categories";
  static const String getCartUri = "/cart";
  static const String addToCartUri = "/cart/add";
  static const String removeFromCartUri = "/cart/remove";
  static const String updateCartUri = "/cart/update";
  static const String checkoutUri = "/checkout";
  static const String loginUri = "/auth/login";
  static const String registerUri = "/auth/register";
  static const String userProfileUri = "/user/profile";
  static const String updateProfileUri = "/user/profile/update";
  static const String searchProductsUri = "/products/search";
  static const String getOrdersUri = "/orders";
  static const String getOrderDetailsUri = "/orders/details";
  static const String getFavoritesUri = "/favorites";
  static const String addToFavoritesUri = "/favorites/add";
  static const String removeFromFavoritesUri = "/favorites/remove";
  static const String getAddressesUri = "/addresses";
  static const String addAddressUri = "/addresses/add";
  static const String updateAddressUri = "/addresses/update";
  static const String deleteAddressUri = "/addresses/delete";
  static const String getPaymentMethodsUri = "/payment-methods";
  static const String addPaymentMethodUri = "/payment-methods/add";
  static const String removePaymentMethodUri = "/payment-methods/remove";
  static const String getNotificationsUri = "/notifications";
  static const String markNotificationReadUri = "/notifications/read";
  static const String deleteNotificationUri = "/notifications/delete";
  static const String getExclusiveOffersUri = "/api/products/exclusive-offers";
  static const String getBestSellingUri = "/api/products/best-selling";

  // =====================
  // Shared Preferences Keys
  static const String TOKEN = "token";
  static const String LOCALIZATION_KEY = 'localization_key';

  // =====================
  // Languages
  // =====================
  static List<LanguageModel> languages = [
    LanguageModel(
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      languageName: 'Spanish',
      countryCode: 'ES',
      languageCode: 'es',
    ),
    LanguageModel(
      languageName: 'French',
      countryCode: 'FR',
      languageCode: 'fr',
    ),
    LanguageModel(
      languageName: 'German',
      countryCode: 'DE',
      languageCode: 'de',
    ),
    LanguageModel(
      languageName: 'Chinese',
      countryCode: 'CN',
      languageCode: 'zh',
    ),
  ];
}
