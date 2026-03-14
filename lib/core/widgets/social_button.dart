import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  const SocialButton({super.key, required this.title, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
    const EdgeInsets.symmetric(horizontal: 40),child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // blue button
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
    )
    );
  }
}