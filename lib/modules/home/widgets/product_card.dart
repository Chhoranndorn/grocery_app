import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼️ Image
          Center(
            child: Image.network(
              product.image,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(
            product.category ?? '',
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}