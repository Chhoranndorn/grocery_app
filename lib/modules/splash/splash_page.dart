import 'package:flutter/material.dart';
import 'package:grocery_app/core/utils/images.dart';
import 'package:grocery_app/modules/onboard/onboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnboardPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Images.logo, width: 60, height: 60),
              SizedBox(width: 10,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("nectar",style: TextStyle(fontSize: 70,color: Colors.white,height: 0.8),),
                  Text("online groceriet", style: TextStyle(fontSize: 16, color:Colors.white, letterSpacing: 5)),
                  
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
