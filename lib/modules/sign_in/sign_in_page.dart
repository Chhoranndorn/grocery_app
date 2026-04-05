import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/core/utils/images.dart';
import 'package:grocery_app/core/widgets/phone_input.dart';
import 'package:grocery_app/core/widgets/social_button.dart';
import 'package:grocery_app/modules/phonenumber/phone_number_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Images.signin),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Get your groceries \nwith nectar",
              style: TextStyle(fontSize: 25),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PhoneNumberPage()),
              );
            },
            child: AbsorbPointer(
              child: PhoneInput(controller: phoneController),
            ),
          ),
          SizedBox(height: 30),
          Center(child: Text("Or connect with social media")),
          SizedBox(height: 30),
          SocialButton(
            title: "Continue with Google",
            icon: Icons.g_mobiledata,
            onPressed: () {},
          ),
          SizedBox(height: 20),
          SocialButton(
            title: "Continue with Facebook",
            icon: Icons.facebook,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
