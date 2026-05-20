import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:grocery_app/controller/product_controller.dart';
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
      "image": "https://picsum.photos/200",
      "color": const Color(0xFFF8EEDF),
    },
    {
      "title": "Rice",
      "image": "https://picsum.photos/201",
      "color": const Color(0xFFE8F3EC),
    },
    {
      "title": "Meat",
      "image": "https://picsum.photos/202",
      "color": const Color(0xFFFFE5E5),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SearchBarWidget(),
              BannerSlider(),
              SectionTitle(title: "Exclusive Offer"),
              ProductHorizontalList(),
              SectionTitle(title: "Best Selling"),
              ProductHorizontalList(),
              SectionTitle(title: "Groceries"),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryCard(
                      title: category['title'],
                      image: category['image'],
                      backgroundColor: category['color'],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              ProductHorizontalList(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
