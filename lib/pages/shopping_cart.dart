import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/shopping_cart_provider.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingCart = ref.watch(shoppingCartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: shoppingCart.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(shoppingCart[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(shoppingCartProvider.notifier).removeIngredient(shoppingCart[index]);
              },
            ),
          );
        },
      ),
    );
  }
}