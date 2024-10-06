import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

// Enum representing different types of filters.
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

// Notifier class for managing filter states.
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
    Filter.glutenFree: false, // Initial state for gluten-free filter.
    Filter.lactoseFree: false, // Initial state for lactose-free filter.
    Filter.vegetarian: false, // Initial state for vegetarian filter.
    Filter.vegan: false, // Initial state for vegan filter.
  });

  // Method to set multiple filters at once.
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  // Method to set a single filter.
  void setFilter(Filter filter, bool isActive) {
    // Update the state with the new filter value.
    state = {
      ...state,
      filter: isActive,
    };
  }
}

// Provider for the filters notifier.
final filtersProvider =
StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
);

// Provider for the filtered meals.
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider); // Watch the list of meals.
  final activeFilters = ref.watch(filtersProvider); // Watch the active filters.

  // Filter the meals based on the active filters.
  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});