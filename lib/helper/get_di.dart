import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth_controller.dart';
import 'package:grocery_app/core/utils/app_constants.dart';
import 'package:grocery_app/data/models/language_model.dart';
import 'package:grocery_app/data/repository/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  // =====================
  // SharedPreferences
  // =====================
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // =====================
  // Repositories (Mock)
  // =====================
  Get.lazyPut(() => MockAuthRepo());

  // =====================
  // Controllers
  // =====================
  Get.lazyPut(() => AuthController(authRepo: Get.find()));

  // =====================
  // Localization (Optional)
  // =====================
  Map<String, Map<String, String>> languages = {};

  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle.loadString(
      'assets/language/${languageModel.languageCode}.json',
    );
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = '${value.toString()}';
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        json;
  }

  return languages;
}
