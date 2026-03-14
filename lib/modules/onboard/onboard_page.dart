import 'package:flutter/material.dart';
import 'package:grocery_app/core/utils/images.dart';
import 'package:grocery_app/core/widgets/primary_button.dart';
import 'package:grocery_app/modules/sign_in/sign_in_page.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(Images.onboarding,fit: BoxFit.cover,),),
       
         Align(
          alignment: Alignment.bottomCenter,
           child: Padding(
             padding: const EdgeInsets.only(bottom: 80),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               
               children: [
                 
                 
                 Image.asset(Images.logo, width: 50,),
                 SizedBox(height: 20,),
                 Text("Welcome \nto our store", style: TextStyle(fontSize: 40, color:Colors.white),textAlign: TextAlign.center,),
                 Text("Get your groceries in as fast as one hour",style: TextStyle(fontSize: 16,color: Colors.white),),
                 SizedBox(height: 20,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInPage()));
                  },
                   child: Center(child: PrimaryButton(title: "Get Started",onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                   },)),
                 )
               ],
             ),
           ),
         ),
         ],
      ),
    );
  }
}