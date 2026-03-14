

import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_appbar.dart';
import 'package:grocery_app/core/widgets/phone_input.dart';
import 'package:grocery_app/modules/verification/verification_page.dart';

class PhoneNumberPage extends StatefulWidget {
   const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
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
    return  Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Enter your phone number", style: TextStyle(fontSize: 25),),
                ),
                PhoneInput(controller: phoneController),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationPage()));
                      },
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    ),
                  ),
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}