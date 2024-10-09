import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

// A widget that represents a grid item for a category.
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category, // The category to display.
    required this.onSelectCategory, // Callback when the category is selected.
  });

  final Category category; // The category object.
  final void Function() onSelectCategory; // Callback function for category selection.

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory, // Handle tap event.
      splashColor: Theme.of(context).primaryColor, // Splash color on tap.
      borderRadius: BorderRadius.circular(16), // Rounded corners.
      child: Container(
        padding: const EdgeInsets.all(16), // Padding inside the container.
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // Rounded corners.
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55), // Gradient start color.
              category.color.withOpacity(0.9), // Gradient end color.
            ],
            begin: Alignment.topLeft, // Gradient start position.
            end: Alignment.bottomRight, // Gradient end position.
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getCategoryIcon(category.id), // Get the appropriate icon.
              size: 48,
              color: Theme.of(context).colorScheme.onBackground, // Icon color.
            ),
            const SizedBox(height: 10),
            Text(
              category.title, // Category title.
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground, // Text color.
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String categoryId) {
    switch (categoryId) {
      case 'c1':
        return Icons.local_pizza; // Italian
      case 'c2':
        return Icons.timer; // Quick and Easy
      case 'c3':
        return Icons.fastfood; // Hamburger
      case 'c4':
        return Icons.restaurant; // German
      case 'c5':
        return Icons.local_cafe; // Light & Lovely
      case 'c6':
        return Icons.public; // Exotic
      case 'c7':
        return Icons.breakfast_dining; // Breakfast
      case 'c8':
        return Icons.rice_bowl; // Asian
      case 'c9':
        return Icons.cake; // French
      case 'c10':
        return Icons.wb_sunny; // Summer
      default:
        return Icons.circle; // Default icon
    }
  }
}