import 'dart:async';

import 'package:get/get.dart';
import 'package:grocery_app/core/enums/status_enum.dart';
import 'package:grocery_app/data/repository/auth_repo.dart';
import 'package:grocery_app/helper/route_helper.dart';

class AuthController extends GetxController {
  // final MockAuthRepo authRepo;
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  var isLoading = false.obs;
  var phoneNumber = ''.obs;

  var resendSeconds = 0.obs;
  Timer? _timer;

  var status = Status.idle.obs;

  void sendOtp(String number) async {
    isLoading.value = true;
    phoneNumber.value = number;

    final response = await authRepo.sendOtp(number);
    isLoading.value = false;

    if (response.status == Status.success) {
      Get.snackbar('Success', 'OTP sent to $number');
      startResendTimer();
    } else {
      Get.snackbar('Error', response.message);
    }
  }

  Future<void> verifyOtp(String otp) async {
    status.value = Status.loading;

    final response = await authRepo.verifyOtp(phoneNumber.value, otp);

    if (response.status == Status.success) {
      status.value = Status.success;
      Get.snackbar('Success', response.message);
      Get.offAllNamed(RouteHelper.selectLocation);
    } else {
      status.value = Status.idle;
      Get.snackbar('Error', response.message);
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

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final response = await authRepo.login(email, password);
    isLoading.value = false;
    if (response.status == Status.success) {
      Get.snackbar("Success", response.message);
      Get.offAllNamed(RouteHelper.home);
    } else {
      Get.snackbar("Error", response.message);
    }
  }

  Future<void> signup(String userName, String email, String password) async {
    isLoading.value = true;
    final response = await authRepo.signup(userName, email, password);
    isLoading.value = false;
    if (response.status == Status.success) {
      Get.snackbar("Sucess", response.message);
      Get.offAllNamed(RouteHelper.loginPage);
    } else {
      Get.snackbar("Error", response.message);
    }
  }

  // static bool _isForceLoggingOut = false;

  // Future<void> forceLogout() async {
  //   if (_isForceLoggingOut) return;
  //   _isForceLoggingOut = true;

  //   try {
  //     await logout();
  //     Get.offAll(() => const LoginScreen());
  //   } finally {
  //     _isForceLoggingOut = false;
  //   }
  // }
  // Future<void> logout() async {
  //   try {
  //     // Clear SharedPreferences + Firebase + API client header
  //     await authRepo.logout();

  //     if (Get.isRegistered<ProfileController>()) {
  //       Get.find<ProfileController>().clearProfile();
  //     }

  //     // Sign out Google if was signed in
  //     try {
  //       final google = Get.find<GoogleSignInController>();
  //       await google.logout();
  //     } catch (_) {}

  //     // Reset driver state
  //     _isDriver.value = false;

  //     update();
  //   } catch (e) {
  //     debugPrint('Logout error: $e');
  //   }
  // }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
