import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/shopping_cart_provider.dart';

class ShoppingCartScreen extends ConsumerStatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends ConsumerState<ShoppingCartScreen> {
  final Map<String, bool> _checkedItems = {};

  @override
  Widget build(BuildContext context) {
    final shoppingCart = ref.watch(shoppingCartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: shoppingCart.length,
        itemBuilder: (ctx, index) {
          final item = shoppingCart[index];
          final isChecked = _checkedItems[item] ?? false;

          return ListTile(
            leading: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _checkedItems[item] = value ?? false;
                });
              },
            ),
            title: Text(
              item,
              style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
                color: isChecked ? Colors.grey : Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(shoppingCartProvider.notifier).removeIngredient(item);
                setState(() {
                  _checkedItems.remove(item);
                });
              },
            ),
          );
        },
      ),
    );
  }
}