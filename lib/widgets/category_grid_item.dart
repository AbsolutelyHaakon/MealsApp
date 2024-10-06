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
        child: Text(
          category.title, // Category title.
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground, // Text color.
          ),
        ),
      ),
    );
  }
}