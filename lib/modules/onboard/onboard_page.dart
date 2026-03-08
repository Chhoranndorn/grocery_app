import 'package:flutter/material.dart';
import 'package:grocery_app/core/utils/images.dart';
import 'package:grocery_app/modules/sign_in/sign_in_page.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInPage()));
                  },
                   child: Container(
                     width: double.infinity,
                     margin: EdgeInsets.symmetric(horizontal: 40),
                     padding: EdgeInsets.symmetric(vertical: 18),
                     decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(25)),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Center(child: Text("Get Started", style: TextStyle(fontSize: 16, color: Colors.white),)),
                     ),
                   ),
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