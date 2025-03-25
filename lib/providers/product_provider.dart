import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product_model.dart';
import '../repositories/product_repository.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository());

final productProvider = FutureProvider<List<Product>>((ref) async {
  return ref.read(productRepositoryProvider).fetchProducts();
});
