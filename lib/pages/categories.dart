import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/pages/meals.dart';
import 'package:meals_app/models/category.dart';

// StatefulWidget for displaying categories.
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required List<Meal> availableMeals, // List of available meals.
    required bool showImages, // Flag to show images or not.
  }) : _showImages = showImages, _availableMeals = availableMeals;

  final List<Meal> _availableMeals; // List of meals available.
  final bool _showImages; // Boolean to determine if images should be shown.

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// State class for CategoriesScreen.
class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController; // Controller for animations.

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller.
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward(); // Start the animation.
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the animation controller.
    super.dispose();
  }

  // Method to handle category selection.
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget._availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: widget._showImages
          ? GridView(
              padding: const EdgeInsets.all(24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                for (final category in availableCategories)
                  CategoryGridItem(
                    category: category,
                    onSelectCategory: () {
                      _selectCategory(context, category);
                    },
                  )
              ],
            )
          : ListView(
              padding: const EdgeInsets.all(24),
              children: [
                for (final category in availableCategories)
                  CupertinoListTile(
                    leading: Icon(
                      _getCategoryIcon(category.id),
                      size: 26,
                      color: CupertinoColors.white,
                    ),
                    title: Text(
                      category.title,
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 24,
                            color: CupertinoColors.white,
                          ),
                    ),
                    onTap: () {
                      _selectCategory(context, category);
                    },
                  )
              ],
            ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
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

class CupertinoListTile extends StatelessWidget {
  const CupertinoListTile({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
  });

  final Widget leading;
  final Widget title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 16),
            Expanded(child: title),
          ],
        ),
      ),
    );
  }
}