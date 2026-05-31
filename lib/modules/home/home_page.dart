import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grocery_app/controller/category_controller.dart';
import 'package:grocery_app/controller/product_controller.dart';
import 'package:grocery_app/modules/Explore/category_detail_page.dart';
import 'package:grocery_app/modules/Explore/product_search_page.dart';
import 'package:grocery_app/modules/home/widgets/banner_slider.dart';
import 'package:grocery_app/modules/home/widgets/category_card.dart';
import 'package:grocery_app/modules/home/widgets/header.dart';
import 'package:grocery_app/modules/home/widgets/product_card.dart';
import 'package:grocery_app/modules/home/widgets/product_horizontal_list.dart';
import 'package:grocery_app/modules/home/widgets/search_bar.dart';
import 'package:grocery_app/modules/home/widgets/section_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productController = Get.find<ProductController>();
  final categoryController = Get.find<CategoryController>();

  void _openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductSearchPage(products: _allProducts()),
      ),
    );
  }

  List<CategoryProduct> _allProducts() {
    return productController.allProducts.map<CategoryProduct>((product) {
      return CategoryProduct(
        name: product.name,
        detail: product.category,
        price: product.price,
        category: product.category,
        brand: product.brand,
        image: product.image,
      );
    }).toList();
  }

  List<CategoryProduct> _exclusiveOffers() {
    return productController.exclusiveOffers.map<CategoryProduct>((product) {
      return CategoryProduct(
        name: product.name,
        detail: product.category,
        price: product.price,
        category: product.category,
        brand: product.brand,
        image: product.image,
      );
    }).toList();
  }

  List<CategoryProduct> _bestSelling() {
    return productController.bestSelling.map<CategoryProduct>((product) {
      return CategoryProduct(
        name: product.name,
        detail: product.category,
        price: product.price,
        category: product.category,
        brand: product.brand,
        image: product.image,
      );
    }).toList();
  }

  List<CategoryProduct> _allcategory() {
    return productController.bestSelling.map<CategoryProduct>((product) {
      return CategoryProduct(
        name: product.name,
        detail: product.category,
        price: product.price,
        category: product.category,
        brand: product.brand,
        image: product.image,
      );
    }).toList();
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
                    _openProductGrid("Exclusive Offer", _exclusiveOffers()),
              ),
              ProductHorizontalList(
                products: productController.exclusiveOffers,
              ),
              const SizedBox(height: 18),
              SectionTitle(
                title: "Best Selling",
                onSeeAllTap: () =>
                    _openProductGrid("Best Selling", _bestSelling()),
              ),
              ProductHorizontalList(products: productController.bestSelling),

              const SizedBox(height: 18),
              SectionTitle(
                title: "Groceries",
                onSeeAllTap: () =>
                    _openProductGrid("Best Selling", _allcategory()),
              ),

              Obx(() {
                return SizedBox(
                  height: 104,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    itemCount: categoryController.allCategories.length,
                    itemBuilder: (context, index) {
                      final category = categoryController.allCategories[index];

                      return CategoryCard(
                        title: category.name,
                        image: category.image,
                        backgroundColor: Colors.blue,
                        onTap: () {},
                      );
                    },
                  ),
                );
              }),
              const SizedBox(height: 18),
              ProductHorizontalList(products: productController.allProducts),
            ],
          ),
        ),
      ),
    );
  }
}
