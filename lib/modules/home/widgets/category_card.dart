import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final Color backgroundColor;

  const CategoryCard({
    super.key,
    required this.title,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 260,
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Row(
          children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Image.network(image, fit: BoxFit.contain),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 5,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E423F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
