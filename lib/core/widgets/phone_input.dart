import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController controller;

  const PhoneInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: const Text(
            "Mobile Number",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            CountryCodePicker(
              onChanged: (country) {},
              initialSelection: 'BD',
              favorite: const ['+880', 'BD'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
            ),
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "0123456789",
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}