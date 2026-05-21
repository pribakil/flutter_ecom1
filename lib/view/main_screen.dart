import 'package:ecom1_frontend/controllers/navigation_controller.dart';
import 'package:ecom1_frontend/controllers/theme_controller.dart';
import 'package:ecom1_frontend/view/account_screen.dart';
import 'package:ecom1_frontend/view/widgets/custom_bottom_nav_bar.dart';
import 'package:ecom1_frontend/view/home_screen.dart';
import 'package:ecom1_frontend/view/shopping_screen.dart';
import 'package:ecom1_frontend/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();

    return GetBuilder<ThemeController>(
      builder: (themeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: Obx(
            () => IndexedStack(
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavbar(),
      ),
    );
  }
}
