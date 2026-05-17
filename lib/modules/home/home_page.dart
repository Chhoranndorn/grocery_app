import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:grocery_app/controller/product_controller.dart';
import 'package:grocery_app/modules/home/widgets/banner_slider.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}
