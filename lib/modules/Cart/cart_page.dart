import 'package:flutter/material.dart';
import 'package:grocery_app/modules/Cart/order_result_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<_CartItem> _items = [
    _CartItem(
      name: 'Bell Pepper Red',
      detail: '1kg, Price',
      price: 4.99,
      image:
          'https://www.pngarts.com/files/5/Red-Bell-Pepper-PNG-Image-Background.png',
    ),
    _CartItem(
      name: 'Egg Chicken Red',
      detail: '4pcs, Price',
      price: 1.99,
      image:
          'https://www.pngarts.com/files/4/Egg-Basket-PNG-High-Quality-Image.png',
    ),
    _CartItem(
      name: 'Organic Bananas',
      detail: '12kg, Price',
      price: 3.00,
      image: 'https://www.pngarts.com/files/1/Banana-PNG-Transparent-Image.png',
    ),
    _CartItem(
      name: 'Ginger',
      detail: '250gm, Price',
      price: 2.99,
      image: 'https://www.pngarts.com/files/8/Ginger-PNG-Free-Download.png',
    ),
  ];

  double get _total {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void _increaseQuantity(int index) {
    setState(() {
      _items[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _showCheckout() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.38),
      builder: (context) {
        return CheckoutSheet(total: _total);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 28),
            const Text(
              'My Cart',
              style: TextStyle(
                color: Color(0xFF181725),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 28),
            const Divider(height: 1, color: Color(0xFFE2E2E2)),
            Expanded(
              child: _items.isEmpty
                  ? const Center(
                      child: Text(
                        'Your cart is empty',
                        style: TextStyle(
                          color: Color(0xFF7C7C7C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(24, 18, 24, 16),
                      itemCount: _items.length,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 28,
                          color: Color(0xFFE2E2E2),
                        );
                      },
                      itemBuilder: (context, index) {
                        return _CartItemRow(
                          item: _items[index],
                          onIncrease: () => _increaseQuantity(index),
                          onDecrease: () => _decreaseQuantity(index),
                          onRemove: () => _removeItem(index),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
              child: SizedBox(
                height: 76,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: _items.isEmpty ? null : _showCheckout,
                  child: SizedBox.expand(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          'Go to Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Positioned(
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF489E67),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '\$${_total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
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

class CheckoutSheet extends StatelessWidget {
  final double total;

  const CheckoutSheet({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF8F9F8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            24,
            26,
            24,
            28 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        color: Color(0xFF181725),
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF181725),
                      size: 34,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              const Divider(height: 1, color: Color(0xFFE2E2E2)),
              _CheckoutRow(
                title: 'Delivery',
                trailing: const Text(
                  'Select Method',
                  style: TextStyle(
                    color: Color(0xFF181725),
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {},
              ),
              _CheckoutRow(
                title: 'Payment',
                trailing: Container(
                  width: 36,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4F7DF3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 10,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF4B3E),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFB534),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
              _CheckoutRow(
                title: 'Promo Code',
                trailing: const Text(
                  'Pick discount',
                  style: TextStyle(
                    color: Color(0xFF181725),
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {},
              ),
              _CheckoutRow(
                title: 'Total Cost',
                trailing: Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Color(0xFF181725),
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 28),
              const Text.rich(
                TextSpan(
                  text: 'By placing an order you agree to our\n',
                  style: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.45,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms And Conditions',
                      style: TextStyle(
                        color: Color(0xFF181725),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 34),
              SizedBox(
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
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderSuccessPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Place Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckoutRow extends StatelessWidget {
  final String title;
  final Widget trailing;
  final VoidCallback onTap;

  const _CheckoutRow({
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 76,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                trailing,
                const SizedBox(width: 16),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF181725),
                  size: 24,
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFE2E2E2)),
        ],
      ),
    );
  }
}

class _CartItemRow extends StatelessWidget {
  final _CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const _CartItemRow({
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 138,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.network(
                item.image,
                height: 82,
                width: 116,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.shopping_basket_outlined,
                    color: Color(0xFF53B175),
                    size: 58,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      constraints: const BoxConstraints.tightFor(
                        width: 36,
                        height: 36,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: onRemove,
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xFFB3B3B3),
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  item.detail,
                  style: const TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _QuantityButton(
                      icon: Icons.remove,
                      color: const Color(0xFFB3B3B3),
                      onTap: onDecrease,
                    ),
                    SizedBox(
                      width: 48,
                      child: Text(
                        item.quantity.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    _QuantityButton(
                      icon: Icons.add,
                      color: const Color(0xFF53B175),
                      onTap: onIncrease,
                    ),
                    const Spacer(),
                    Text(
                      '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color(0xFF181725),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: color,
          side: const BorderSide(color: Color(0xFFE2E2E2)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onTap,
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}

class _CartItem {
  final String name;
  final String detail;
  final double price;
  final String image;
  int quantity = 1;

  _CartItem({
    required this.name,
    required this.detail,
    required this.price,
    required this.image,
  });
}
