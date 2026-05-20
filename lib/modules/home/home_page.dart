import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:grocery_app/controller/product_controller.dart';
import 'package:grocery_app/modules/Explore/category_detail_page.dart';
import 'package:grocery_app/modules/Explore/product_search_page.dart';
import 'package:grocery_app/modules/home/widgets/banner_slider.dart';
import 'package:grocery_app/modules/home/widgets/category_card.dart';
import 'package:grocery_app/modules/home/widgets/header.dart';
import 'package:grocery_app/modules/home/widgets/product_horizontal_list.dart';
import 'package:grocery_app/modules/home/widgets/search_bar.dart';
import 'package:grocery_app/modules/home/widgets/section_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<ProductController>();
  final List<Map<String, dynamic>> categories = [
    {
      "title": "Pulses",
      "image":
          "https://www.pngarts.com/files/4/Pulses-PNG-High-Quality-Image.png",
      "color": const Color(0xFFF8EEDF),
      "products": const [
        CategoryProduct(
          name: 'Pulses',
          detail: '1kg, Price',
          price: 4.99,
          category: 'Groceries',
          image:
              'https://www.pngarts.com/files/4/Pulses-PNG-High-Quality-Image.png',
        ),
      ],
    },
    {
      "title": "Rice",
      "image": "https://www.pngarts.com/files/4/Rice-PNG-Picture.png",
      "color": const Color(0xFFE8F3EC),
      "products": const [
        CategoryProduct(
          name: 'Rice',
          detail: '1kg, Price',
          price: 4.99,
          category: 'Groceries',
          image: 'https://www.pngarts.com/files/4/Rice-PNG-Picture.png',
        ),
      ],
    },
    {
      "title": "Meat",
      "image": "https://www.pngarts.com/files/4/Meat-PNG-Free-Download.png",
      "color": const Color(0xFFFFE5E5),
      "products": const [
        CategoryProduct(
          name: 'Beef Bone',
          detail: '1kg, Price',
          price: 4.99,
          category: 'Groceries',
          image: 'https://www.pngarts.com/files/4/Meat-PNG-Free-Download.png',
        ),
      ],
    },
  ];

  void _openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductSearchPage(products: _allProducts()),
      ),
    );
  }

  List<CategoryProduct> _allProducts() {
    return controller.productList.map<CategoryProduct>((product) {
      return CategoryProduct(
        name: product.name,
        detail: product.category.isEmpty ? '1kg, Price' : product.category,
        price: product.price,
        category: product.category,
        brand: product.brand,
        image: product.image,
      );
    }).toList();
  }

  List<CategoryProduct> _groceryProducts() {
    return [
      for (final category in categories) ..._productsForCategory(category),
    ];
  }

  void _openProductGrid(String title, List<CategoryProduct> products) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CategoryDetailPage(title: title, products: products),
      ),
    );
  }

  List<CategoryProduct> _productsForCategory(Map<String, dynamic> category) {
    final products = category['products'];

    if (products is List<CategoryProduct>) {
      return products;
    }

    final title = category['title']?.toString() ?? 'Groceries';
    final image = category['image']?.toString() ?? '';

    return [
      CategoryProduct(
        name: title,
        detail: '1kg, Price',
        price: 4.99,
        category: 'Groceries',
        image: image,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              SearchBarWidget(onTap: _openSearch),
              const BannerSlider(),
              const SizedBox(height: 8),
              SectionTitle(
                title: "Exclusive Offer",
                onSeeAllTap: () =>
                    _openProductGrid("Exclusive Offer", _allProducts()),
              ),
              ProductHorizontalList(),
              const SizedBox(height: 18),
              SectionTitle(
                title: "Best Selling",
                onSeeAllTap: () =>
                    _openProductGrid("Best Selling", _allProducts()),
              ),
              ProductHorizontalList(),
              const SizedBox(height: 18),
              SectionTitle(
                title: "Groceries",
                onSeeAllTap: () =>
                    _openProductGrid("Groceries", _groceryProducts()),
              ),
              SizedBox(
                height: 104,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryCard(
                      title: category['title'],
                      image: category['image'],
                      backgroundColor: category['color'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryDetailPage(
                              title: category['title'],
                              products: _productsForCategory(category),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              ProductHorizontalList(),
            ],
          ),
        ),
      ),
    );
  }
}
