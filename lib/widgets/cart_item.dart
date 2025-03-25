import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import '../providers/cart_provider.dart';

class CartItem extends ConsumerWidget {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double discountedPrice = product.price - (product.price * product.discountPercentage / 100);

    return Card(
      child: ListTile(
        leading: Image.network(product.thumbnail, width: 100,),
        title: Text(product.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Original Price and Discounted Price
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

        // Quantity Selector Buttons
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => ref.read(cartProvider.notifier).removeFromCart(product),
            ),
            Text(quantity.toString(), style: TextStyle(fontSize: 18, color: Colors.pink)),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => ref.read(cartProvider.notifier).addToCart(product),
            ),
          ],
        ),
      ),
    );
  }
}
