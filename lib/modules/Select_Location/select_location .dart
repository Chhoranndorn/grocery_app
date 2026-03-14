import 'package:flutter/material.dart';
import 'package:grocery_app/core/utils/images.dart';
import 'package:grocery_app/core/widgets/custom_appbar.dart';
import 'package:grocery_app/core/widgets/custom_dropdown.dart';
import 'package:grocery_app/core/widgets/custom_textfield.dart';
import 'package:grocery_app/core/widgets/primary_button.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  String? selectedZone;
  String? selectedArea;
  final Map<String, List<String>> areaMap = {
    "Phnom Penh": ["Chamkar Mon", "Toul Kork", "Sen Sok"],
    "Kandal": ["Ta Khmau", "Kien Svay"],
    "Siem Reap": ["Svay Dangkum", "Sala Kamreuk"],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(Images.selectLocation, width: 250),
                    Text(
                      "Select your location",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Switch on your location to stay in tune with what's happening in your area",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50),
                    CustomDropdownField(
                      label: "Your Zone",
                      hint: "Choose your zone",
                      value: selectedZone,
                      items: areaMap.keys.toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedZone = value;
                          selectedArea = null;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    CustomDropdownField(
                      label: "Your Area",
                      hint: "Choose your area",
                      value: selectedArea,
                      items: selectedZone == null ? [] : areaMap[selectedZone]!,
                      onChanged: (value) {
                        setState(() {
                          selectedArea = value;
                        });
                      },
                    ),
                    SizedBox(height: 40),

                    PrimaryButton(title: "Submit", onPressed: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
