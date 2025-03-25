import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final totalPrice = ref.watch(cartProvider.notifier).totalPrice;

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text("Cart", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.pink[50],
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: cartItems.entries
                  .map((entry) => CartItem(product: entry.key, quantity: entry.value))
                  .toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text("Amount Price", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 12),
                    Text("₹${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  ],
                ),
                ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      
                      ),
                      onPressed: () {}, 
                      child: Text("Check Out (${cartItems.length})", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
