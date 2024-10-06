import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/meal.dart';

// Notifier class for managing favorite meals.
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); // Initialize with an empty list.

  // Method to toggle the favorite status of a meal.
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal); // Check if the meal is already a favorite.

    if (mealIsFavorite) {
      // If the meal is a favorite, remove it from the list.
      state = state.where((m) => m.id != meal.id).toList();
      return false; // Return false indicating the meal was removed.
    } else {
      // If the meal is not a favorite, add it to the list.
      state = [...state, meal];
      return true; // Return true indicating the meal was added.
    }
  }
}

// Provider for the favorite meals notifier.
final favoriteMealsProvider =
StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier(); // Return an instance of the notifier.
});