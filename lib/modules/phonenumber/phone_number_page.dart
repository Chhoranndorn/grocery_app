import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:grocery_app/controller/auth_controller.dart';
import 'package:grocery_app/core/widgets/custom_appbar.dart';
import 'package:grocery_app/core/widgets/phone_input.dart';
import 'package:grocery_app/modules/verification/verification_page.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final authController = Get.find<AuthController>();
  final TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Enter your phone number",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                PhoneInput(controller: phoneController),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {
                        // print("Phone Number: ${phoneController.text.trim()}");
                        // authController.sendOtp(phoneController.text.trim());
                        // Get.to(() => VerificationPage());
                        String phone = phoneController.text.trim();
                        if (phone.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "Please enter your phone number",
                          );
                          return;
                        }
                        authController.sendOtp(phone);
                        Get.to(() => VerificationPage());
                      },
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
