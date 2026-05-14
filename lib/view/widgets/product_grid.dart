import 'package:ecom1_frontend/models/product.dart';
import 'package:ecom1_frontend/view/product_details_screen.dart';
import 'package:ecom1_frontend/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => ProductDetailsScreen(product: product),
            ),
          ),
          child: ProductCard(product: product),
        );
      },
    );
  }
}
