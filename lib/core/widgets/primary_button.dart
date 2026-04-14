import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const PrimaryButton({super.key , required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container( width: double.infinity,
               
                     padding: EdgeInsets.symmetric(horizontal: 40),
                     child: ElevatedButton(onPressed: onPressed,style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 18),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                     ), child: Text(title))),
    );
  }
}