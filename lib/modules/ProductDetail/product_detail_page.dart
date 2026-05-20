import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatefulWidget {
  final dynamic product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  final PageController pageController = PageController();

  int currentPage = 0;

  void _goBack() {
    final navigator = Navigator.of(context);

    if (navigator.canPop()) {
      navigator.pop();
      return;
    }

    if (Get.key.currentState?.canPop() ?? false) {
      Get.back();
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),

        child: SizedBox(
          height: 60,

          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF53B175),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),

            onPressed: () {},

            child: const Text(
              'Add To Basket',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// IMAGE SECTION
              Container(
                height: 350,
                width: double.infinity,

                decoration: const BoxDecoration(
                  color: Color(0xFFF2F3F2),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),

                    bottomRight: Radius.circular(30),
                  ),
                ),

                child: Stack(
                  children: [
                    /// IMAGE SLIDER
                    Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: pageController,

                            itemCount: 3,

                            onPageChanged: (index) {
                              setState(() {
                                currentPage = index;
                              });
                            },

                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(40),

                                child: Image.network(
                                  product.image,

                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          ),
                        ),

                        /// DOTS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: List.generate(
                            3,

                            (index) => Container(
                              margin: const EdgeInsets.only(
                                right: 5,
                                bottom: 20,
                              ),

                              width: currentPage == index ? 18 : 6,

                              height: 6,

                              decoration: BoxDecoration(
                                color: currentPage == index
                                    ? const Color(0xFF53B175)
                                    : Colors.grey.shade400,

                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// BACK BUTTON
                    Positioned(
                      top: 16,
                      left: 16,

                      child: SafeArea(
                        child: IconButton(
                          onPressed: _goBack,

                          icon: const Icon(Icons.arrow_back_ios, size: 22),
                        ),
                      ),
                    ),

                    /// SHARE BUTTON
                    Positioned(
                      top: 16,
                      right: 16,

                      child: IconButton(
                        onPressed: () {},

                        icon: const Icon(Icons.upload_outlined, size: 28),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// PRODUCT INFO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// NAME + FAVORITE
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                product.name,

                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,

                                  color: Color(0xFF181725),
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                '1kg, Price',

                                style: TextStyle(
                                  fontSize: 16,

                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          onPressed: () {},

                          icon: const Icon(Icons.favorite_border, size: 30),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    /// QUANTITY + PRICE
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),

                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },

                                icon: Icon(
                                  Icons.remove,

                                  color: Colors.grey.shade600,
                                ),
                              ),

                              Text(
                                quantity.toString(),

                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },

                                icon: const Icon(
                                  Icons.add,

                                  color: Color(0xFF53B175),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        Text(
                          '\$${product.price}',

                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,

                            color: Color(0xFF181725),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Divider(color: Colors.grey.shade300),

                    const SizedBox(height: 20),

                    /// PRODUCT DETAIL
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text(
                          'Product Detail',

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Icon(
                          Icons.keyboard_arrow_down,

                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Text(
                      'Apples are nutritious and may support weight loss, heart health, and a healthy diet. Fresh organic apples directly from the farm.',

                      style: TextStyle(
                        height: 1.6,
                        fontSize: 15,

                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 28),

                    Divider(color: Colors.grey.shade300),

                    const SizedBox(height: 20),

                    /// NUTRITIONS
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Nutritions',

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F3F2),

                            borderRadius: BorderRadius.circular(8),
                          ),

                          child: Text(
                            '100gr',

                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Icon(Icons.arrow_forward_ios, size: 18),
                      ],
                    ),

                    const SizedBox(height: 28),

                    Divider(color: Colors.grey.shade300),

                    const SizedBox(height: 20),

                    /// REVIEW
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Review',

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Row(
                          children: List.generate(
                            5,

                            (index) => const Padding(
                              padding: EdgeInsets.only(right: 2),

                              child: Icon(
                                Icons.star,

                                size: 20,

                                color: Color(0xFFFFA726),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Icon(Icons.arrow_forward_ios, size: 18),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
