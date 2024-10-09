import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/pages/categories.dart';
import 'package:meals_app/pages/filters.dart';
import 'package:meals_app/pages/meals.dart';
import 'package:meals_app/pages/shopping_cart.dart';
import 'package:meals_app/widgets/drawer.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';

// Main screen with tabs for categories and favorites.
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0; // Index of the currently selected tab.
  bool _showImages = true; // Flag to toggle between image and list view.

  // Method to select a tab.
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Method to toggle between image and list view.
  void _toggleView() {
    setState(() {
      _showImages = !_showImages;
    });
  }

  // Method to navigate to a different screen.
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    } else if (identifier == 'shopping_cart') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const ShoppingCartScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch the filtered meals from the provider.
    final availableMeals = ref.watch(filteredMealsProvider);

    // Default active page is the categories screen.
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
      showImages: _showImages,
    );
    var activePageTitle = 'Categories';

    // If the selected tab is favorites, show the favorites screen.
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle), // Title of the app bar.
        actions: _selectedPageIndex == 0
            ? [
                IconButton(
                  icon: Icon(_showImages ? Icons.list : Icons.image), // Icon to toggle view.
                  onPressed: _toggleView,
                ),
              ]
            : null,
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen, // Drawer for navigation.
      ),
      body: activePage, // Body of the scaffold.
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage, // Method to select a tab.
        currentIndex: _selectedPageIndex, // Current selected tab index.
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}