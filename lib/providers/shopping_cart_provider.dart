import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingCartProvider = StateNotifierProvider<ShoppingCartNotifier, List<String>>((ref) {
  return ShoppingCartNotifier();
});

class ShoppingCartNotifier extends StateNotifier<List<String>> {
  ShoppingCartNotifier() : super([]);

  void addIngredients(List<String> ingredients) {
    state = [...state, ...ingredients];
  }
}