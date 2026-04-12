import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:grocery_app/controller/auth_controller.dart';
import 'package:grocery_app/core/widgets/custom_appbar.dart';
import 'package:grocery_app/modules/SelectLocation/select_location%20.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final authController = Get.find<AuthController>();
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter your 4-digit code", style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Code",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    style: const TextStyle(fontSize: 24, letterSpacing: 12),
                    decoration: const InputDecoration(
                      counterText: "",
                      hintText: "- - - -",
                      hintStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black54,
                        letterSpacing: 12,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: authController.resendSeconds.value == 0
                                ? () {
                                    authController.sendOtp(
                                      authController.phoneNumber.value,
                                    );
                                  }
                                : null,
                            child: Text(
                              authController.resendSeconds.value == 0
                                  ? "Resend Code"
                                  : "Resend in ${authController.resendSeconds.value}s",
                              style: TextStyle(
                                color: authController.resendSeconds.value == 0
                                    ? Colors.green
                                    : Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        Obx(
                          () => CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green,
                            child: authController.isLoading.value
                                ? CircularProgressIndicator(color: Colors.white)
                                : IconButton(
                                    onPressed: () async {
                                      String otp = otpController.text.trim();
                                      if (otp.isEmpty) {
                                        Get.snackbar(
                                          "Error",
                                          "Please enter the OTP",
                                        );
                                        return;
                                      }
                                      bool isSuccess = await authController
                                          .verifyOtp(otpController.text.trim());
                                      if (isSuccess) {
                                        Get.to(() => SelectLocation());
                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
