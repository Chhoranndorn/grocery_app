import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:grocery_app/core/utils/images.dart';
import 'package:grocery_app/core/widgets/custom_textfield.dart';
import 'package:grocery_app/core/widgets/primary_button.dart';
import 'package:grocery_app/helper/route_helper.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
              _LoginHeader(
                usernameController: usernameController,
                emailController: emailController,
                passwordController: passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const _LoginHeader({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign Up",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "Enter your credentials to continue",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: "Username",
            hint: "Enter your username",
            controller: usernameController,
          ),
          SizedBox(height: 20),

          CustomTextField(
            label: "Email",
            hint: "Enter your email",
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          SizedBox(height: 20),
          CustomTextField(
            label: "Password",
            hint: "Enter your password",
            obscureText: true,
            controller: passwordController,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "By continuing you agree to our Terms of Service and Privacy Policy.",
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          PrimaryButton(
            title: "Login",
            onPressed: () {
              // Handle login logic here
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Get.toNamed(RouteHelper.signUp);
                },
                child: Text("Sign Up", style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
