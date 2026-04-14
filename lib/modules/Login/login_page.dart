import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grocery_app/controller/auth_controller.dart';
import 'package:grocery_app/controller/login_controller.dart';
import 'package:grocery_app/core/utils/dimensions.dart';
import 'package:grocery_app/core/utils/images.dart';
import 'package:grocery_app/core/widgets/custom_textfield.dart';
import 'package:grocery_app/core/widgets/primary_button.dart';
import 'package:grocery_app/helper/route_helper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final authController = Get.find<AuthController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              SizedBox(height: Dimensions.paddingSizeExtraLarge + 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Image.asset(AppIcons.carrot, width: 50)],
              ),
              SizedBox(height: Dimensions.paddingSizeLarge + 50),
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter your emails and password",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      focusNode: controller.emailFocus,
                      nextFocusNode: controller.passwordFocus,
                      label: "Email",
                      hint: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      focusNode: controller.passwordFocus,
                      nextFocusNode: null,
                      label: "Password",
                      hint: "Enter your password",
                      obscureText: true,
                      controller: controller.passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => PrimaryButton(
                        title: authController.isLoading.value
                            ? "Loading..."
                            : "Login",
                        onPressed: authController.isLoading.value
                            ? null
                            : controller.login,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            print("Navigate to Sign Up Page");
                            // return;
                            Get.toNamed(RouteHelper.signUp);
                          },
                          child: Text(
                            "Sign Up",
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
