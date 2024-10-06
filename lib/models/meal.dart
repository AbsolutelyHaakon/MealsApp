// Enum representing the complexity levels of a meal.
enum Complexity {
  simple,
  challenging,
  hard,
}

// Enum representing the affordability levels of a meal.
enum Affordability {
  affordable,
  pricey,
  luxurious,
}

// Class representing a meal with various properties.
class Meal {
  const Meal({
    required this.id, // Unique identifier for the meal.
    required this.categories, // List of category IDs the meal belongs to.
    required this.title, // Title of the meal.
    required this.imageUrl, // URL of the meal's image.
    required this.ingredients, // List of ingredients needed for the meal.
    required this.steps, // Steps to prepare the meal.
    required this.duration, // Time required to prepare the meal.
    required this.complexity, // Complexity level of the meal.
    required this.affordability, // Affordability level of the meal.
    required this.isGlutenFree, // Whether the meal is gluten-free.
    required this.isLactoseFree, // Whether the meal is lactose-free.
    required this.isVegan, // Whether the meal is vegan.
    required this.isVegetarian, // Whether the meal is vegetarian.
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  get complexityText => null;
  get affordabilityText => null;
}