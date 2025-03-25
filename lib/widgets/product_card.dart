import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import '../providers/cart_provider.dart';

class ProductCard extends ConsumerWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double discountedPrice = product.price - (product.price * product.discountPercentage / 100);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack to overlay the "Add" button over the image
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(product.thumbnail, height: 150, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () => ref.read(cartProvider.notifier).addToCart(product),
                  child: Text("Add", style: TextStyle(color: Colors.pink, fontSize: 14)),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: TextStyle(fontWeight: FontWeight.bold)),

                // Original price (Strikethrough) and Discounted Price
                Row(
                  children: [
                    Text(
                      "₹${product.price.toStringAsFixed(2)}",
                      style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "₹${discountedPrice.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                // Discount Percentage
                Text("${product.discountPercentage.toStringAsFixed(2)}% OFF",
                    style: TextStyle(color: Colors.pink)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
