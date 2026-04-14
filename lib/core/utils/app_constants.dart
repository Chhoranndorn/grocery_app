import 'package:grocery_app/data/models/language_model.dart';

class AppConstants {
  static const String appName = 'Grocery App';
  static const String appVersion = '1.0.0';
  static const String baseUrl = "https://mock.api.com";

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
