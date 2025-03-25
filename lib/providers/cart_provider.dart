import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';

class CartNotifier extends StateNotifier<Map<Product, int>> {
  CartNotifier() : super({});

  void addToCart(Product product) {
    state = {...state, product: (state[product] ?? 0) + 1};
  }

  void removeFromCart(Product product) {
    if (state[product] == null) return;
    
    if (state[product]! > 1) {
      state = {...state, product: state[product]! - 1};
    } else {
      final newState = Map<Product, int>.from(state);
      newState.remove(product);
      state = newState;
    }
  }

  double get totalPrice {
    return state.entries.fold(0.0, (sum, entry) {
      final product = entry.key;
      final quantity = entry.value;
      double discountedPrice = product.price - (product.price * product.discountPercentage / 100);
      return sum + (discountedPrice * quantity);
    });
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, Map<Product, int>>((ref) => CartNotifier());
