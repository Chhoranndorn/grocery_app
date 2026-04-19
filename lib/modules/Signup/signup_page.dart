import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery_app/controller/auth_controller.dart';
import 'package:grocery_app/controller/signup_controller.dart';
import 'package:grocery_app/core/utils/images.dart';
import 'package:grocery_app/core/widgets/custom_textfield.dart';
import 'package:grocery_app/core/widgets/primary_button.dart';
import 'package:grocery_app/helper/route_helper.dart';

class SignupPage extends StatelessWidget {
  final authController = Get.find<AuthController>();
  final signupController = Get.find<SignupController>();
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              SizedBox(height: 80),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Image.asset(AppIcons.carrot, width: 50)],
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter your credentials to continue",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      focusNode: signupController.usernameFocus,
                      nextFocusNode: signupController.emailFocus,
                      label: "Username",
                      hint: "Enter your username",
                      controller: signupController.usernameController,
                    ),
                    SizedBox(height: 20),

                    CustomTextField(
                      focusNode: signupController.emailFocus,
                      nextFocusNode: signupController.passwordFocus,
                      label: "Email",
                      hint: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                      controller: signupController.emailController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      focusNode: signupController.passwordFocus,
                      nextFocusNode: null,
                      label: "Password",
                      hint: "Enter your password",
                      obscureText: true,
                      controller: signupController.passwordController,
                    ),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: "By continuing you agree to our"),
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Terms of Service tap
                              },
                          ),
                          TextSpan(text: " and "),
                          TextSpan(
                            text: "Privacy Policy.",
                            style: TextStyle(color: Colors.blue, height: 2),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Privacy Policy tap
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => PrimaryButton(
                        title: authController.isLoading.value
                            ? "Loading..."
                            : "Sign Up",
                        onPressed: authController.isLoading.value
                            ? null
                            : signupController.signup,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(RouteHelper.loginPage);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
