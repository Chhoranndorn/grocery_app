import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/banner_controller.dart';
import 'package:grocery_app/core/enums/status_enum.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final BannerController controller = Get.find<BannerController>();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.status.value == Status.loading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.banners.isEmpty) {
        return const SizedBox();
      }

      return Column(
        children: [
          CarouselSlider(
            items: controller.banners.map((banner) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  banner.image ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),

            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,

              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.banners.asMap().entries.map((entry) {
              return Container(
                width: currentIndex == entry.key ? 12 : 6,
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 3),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == entry.key ? Colors.green : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}
