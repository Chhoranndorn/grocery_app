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

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: controller.banners.map((banner) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    banner.image ?? '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFF2F3F2),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.image_outlined,
                          color: Color(0xFF53B175),
                          size: 42,
                        ),
                      );
                    },
                  ),
                );
              }).toList(),

              options: CarouselOptions(
                height: 116,
                autoPlay: true,
                enlargeCenterPage: false,
                viewportFraction: 1,

                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.banners.asMap().entries.map((entry) {
                  final isActive = currentIndex == entry.key;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    width: isActive ? 18 : 7,
                    height: 7,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isActive
                          ? const Color(0xFF53B175)
                          : const Color(0xFFB3B3B3),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
