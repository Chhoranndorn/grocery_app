import 'package:flutter/material.dart';
import 'package:grocery_app/modules/Cart/order_result_page.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  static const List<_FavouriteItem> _items = [
    _FavouriteItem(
      name: 'Sprite Can',
      detail: '325ml, Price',
      price: 1.50,
      image:
          'https://www.pngarts.com/files/3/Sprite-Can-PNG-High-Quality-Image.png',
    ),
    _FavouriteItem(
      name: 'Diet Coke',
      detail: '355ml, Price',
      price: 1.99,
      image:
          'https://www.pngarts.com/files/3/Diet-Coke-Can-PNG-High-Quality-Image.png',
    ),
    _FavouriteItem(
      name: 'Apple & Grape Juice',
      detail: '2L, Price',
      price: 15.50,
      image: 'https://www.pngarts.com/files/6/Fruit-Juice-Bottle-PNG-Image.png',
    ),
    _FavouriteItem(
      name: 'Coca Cola Can',
      detail: '325ml, Price',
      price: 4.99,
      image: 'https://www.pngarts.com/files/3/Coca-Cola-Can-PNG-Pic.png',
    ),
    _FavouriteItem(
      name: 'Pepsi Can',
      detail: '330ml, Price',
      price: 4.99,
      image:
          'https://www.pngarts.com/files/3/Pepsi-Can-PNG-High-Quality-Image.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 28),
            const Text(
              'Favorurite',
              style: TextStyle(
                color: Color(0xFF181725),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 28),
            const Divider(height: 1, color: Color(0xFFE2E2E2)),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                itemCount: _items.length,
                separatorBuilder: (context, index) {
                  return const Divider(height: 28, color: Color(0xFFE2E2E2));
                },
                itemBuilder: (context, index) {
                  return _FavouriteItemRow(item: _items[index]);
                },
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE2E2E2)),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 68, 24, 32),
              child: SizedBox(
                width: double.infinity,
                height: 68,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () => showOrderFailedDialog(context),
                  child: const Text(
                    'Add All To Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavouriteItemRow extends StatelessWidget {
  final _FavouriteItem item;

  const _FavouriteItemRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      child: Row(
        children: [
          SizedBox(
            width: 92,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.network(
                item.image,
                width: 58,
                height: 72,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.local_drink_outlined,
                    color: Color(0xFF53B175),
                    size: 44,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF181725),
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.detail,
                  style: const TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '\$${item.price.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Color(0xFF181725),
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 14),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF181725),
            size: 20,
          ),
        ],
      ),
    );
  }
}

class _FavouriteItem {
  final String name;
  final String detail;
  final double price;
  final String image;

  const _FavouriteItem({
    required this.name,
    required this.detail,
    required this.price,
    required this.image,
  });
}
