import 'package:ecom1_frontend/controllers/theme_controller.dart';
import 'package:ecom1_frontend/view/all_products_screen.dart';
import 'package:ecom1_frontend/view/cart_screen.dart';
import 'package:ecom1_frontend/view/widgets/category_chips.dart';
import 'package:ecom1_frontend/view/widgets/sale_banner.dart';
import 'package:ecom1_frontend/view/widgets/custom_search_bar.dart';
import 'package:ecom1_frontend/view/widgets/product_grid.dart';
import 'package:ecom1_frontend/view/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // header section
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/avatar.jpg"),
                  ),

                  SizedBox(width: 8),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Ilunga",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        "Wellcome Back",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_outlined),
                  ),
                  IconButton(
                    onPressed: () => Get.to(() => CartScreen()),
                    icon: Icon(Icons.shopping_bag_outlined),
                  ),

                  GetBuilder<ThemeController>(
                    builder: (themeController) => IconButton(
                      onPressed: () => themeController.toggleTheme(),
                      icon: Icon(
                        themeController.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // search section
            const CustumSearchBar(),

            // category section
            const CategoryChips(),

            // Sale banner
            const SaleBanner(),

            // Popular products
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular product",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => AllProductsScreen()),
                    child: Text(
                      "See All",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
