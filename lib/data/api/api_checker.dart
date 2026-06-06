import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:grocery_app/core/widgets/show_custom_snackbar_widget.dart';

class ApiChecker {
  static bool _isLoggingOut = false;

  static Future<void> checkApi(Response response) async {
    if (response.statusCode == 401) {
      if (_isLoggingOut) return;

      _isLoggingOut = true;
      try {
        // await Get.find<AuthController>().forceLogout();
      } finally {
        _isLoggingOut = false;
      }
    } else if (response.statusCode == 500) {
      debugPrint('===> Error 500, Internal Server Error <====');
    } else if (response.statusCode == 422) {
      showCustomSnackBar(
        response.statusText!,
        Get.context!,
        isToaster: true,
        isError: true,
      );
    } else {
      showCustomSnackBar(response.statusText!, Get.context!);
    }
  }
}
