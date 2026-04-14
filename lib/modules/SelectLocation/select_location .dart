import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/core/utils/images.dart';
import 'package:grocery_app/core/widgets/custom_appbar.dart';
import 'package:grocery_app/core/widgets/custom_dropdown.dart';
import 'package:grocery_app/core/widgets/primary_button.dart';
import 'package:grocery_app/helper/route_helper.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  String? selectedZone;
  String? selectedArea;

  List<String> zones = ['Zone 1', 'Zone 2', 'Zone 3'];

  List<String> get areas {
    if (selectedZone == 'Zone 1') {
      return ['Area 1-1', 'Area 1-2', 'Area 1-3'];
    } else if (selectedZone == 'Zone 2') {
      return ['Area 2-1', 'Area 2-2', 'Area 2-3'];
    } else if (selectedZone == 'Zone 3') {
      return ['Area 3-1', 'Area 3-2', 'Area 3-3'];
    } else {
      return [];
    }
  }

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
                      items: zones,
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
                      items: areas,
                      onChanged: selectedZone == null
                          ? null
                          : (value) {
                              setState(() {
                                selectedArea = value;
                              });
                            },
                    ),
                    SizedBox(height: 40),

                    PrimaryButton(
                      title: "Submit",
                      onPressed: () {
                        Get.toNamed(RouteHelper.loginPage);
                      },
                    ),
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
