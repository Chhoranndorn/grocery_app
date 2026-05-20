import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final dynamic product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: 148,
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE2E2E2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 76,
              child: Center(
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.shopping_basket_outlined,
                      color: Color(0xFF53B175),
                      size: 42,
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 38,
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF181725),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  height: 1.2,
                ),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              _subtitleFor(product),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF7C7C7C),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _priceFor(product),
                  style: const TextStyle(
                    color: Color(0xFF181725),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),

                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFF53B175),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 26),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _priceFor(dynamic product) {
    final price = product.price;

    if (price is num) {
      return '\$${price.toStringAsFixed(2)}';
    }

    return '\$$price';
  }

  String _subtitleFor(dynamic product) {
    final category = product.category?.toString().trim() ?? '';

    if (category.isEmpty) {
      return '1kg, Price';
    }

    return category.replaceAll('Priceg', 'Price');
  }
}
