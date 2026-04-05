import 'package:get/get.dart';
import 'package:grocery_app/data/repository/auth_repo.dart';

class AuthController extends GetxController {
  final MockAuthRepo authRepo;

  AuthController({required this.authRepo});

  var isLoading = false.obs;
  var phoneNumber = ''.obs;

  void sendOtp(String number) async {
    isLoading.value = true;
    phoneNumber.value = number;

    final response = await authRepo.sendOtp(number);
    isLoading.value = false;

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'OTP sent to $number');
    } else {
      Get.snackbar('Error', response.body['message']);
    }
  }

  void verifyOtp(String otp) async {
    isLoading.value = true;

    final response = await authRepo.verifyOtp(phoneNumber.value, otp);
    isLoading.value = false;

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Login successful');
      print('User Token: ${response.body['token']}');
    } else {
      Get.snackbar('Error', response.body['message']);
    }
  }
}
