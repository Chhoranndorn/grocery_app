import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Column(
        children: [
          // 🥕 Logo
          Center(
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/512/590/590685.png",
              height: 40,
            ),
          ),

          const SizedBox(height: 8),

          // 📍 Location
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, size: 18, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                "Dhaka, Banassre",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}