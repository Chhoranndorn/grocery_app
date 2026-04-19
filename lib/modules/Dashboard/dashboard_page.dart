import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grocery_app/controller/dashboard_controller.dart';
import 'package:grocery_app/modules/Account/account_page.dart';
import 'package:grocery_app/modules/Cart/cart_page.dart';
import 'package:grocery_app/modules/Explore/explore_page.dart';
import 'package:grocery_app/modules/Favourite/favourite_page.dart';
import 'package:grocery_app/modules/Home/home_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Get.put(DashboardController());

  final pages = [
    const HomePage(),
    const ExplorePage(),
    const CartPage(),
    const FavouritePage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shop_outlined),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
