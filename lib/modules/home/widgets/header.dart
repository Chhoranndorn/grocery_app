import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 0),
      child: Column(
        children: [
          Center(
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/512/590/590685.png",
              height: 36,
            ),
          ),

          const SizedBox(height: 8),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 18, color: Color(0xFF4C4F4D)),
              SizedBox(width: 6),
              Text(
                "Dhaka, Banassre",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF4C4F4D),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
