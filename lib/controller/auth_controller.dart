import 'dart:async';

import 'package:get/get.dart';
import 'package:grocery_app/data/repository/auth_repo.dart';

class AuthController extends GetxController {
  final MockAuthRepo authRepo;

  AuthController({required this.authRepo});

  var isLoading = false.obs;
  var phoneNumber = ''.obs;

  var resendSeconds = 0.obs;
  Timer? _timer;

  void sendOtp(String number) async {
    isLoading.value = true;
    phoneNumber.value = number;

    final response = await authRepo.sendOtp(number);
    isLoading.value = false;

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'OTP sent to $number');
      startResendTimer();
    } else {
      Get.snackbar('Error', response.body['message']);
    }
  }

  Future<bool> verifyOtp(String otp) async {
    isLoading.value = true;

    final response = await authRepo.verifyOtp(phoneNumber.value, otp);
    isLoading.value = false;

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Login successful');
      print('User Token: ${response.body['token']}');
      return true;
    } else {
      Get.snackbar('Error', response.body['message']);
      return false;
    }
  }

  void startResendTimer() {
    resendSeconds.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds.value > 0) {
        resendSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
