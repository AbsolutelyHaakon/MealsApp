import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

// Screen for displaying a list of meals.
class MealsScreen extends StatefulWidget {
  const MealsScreen({
    super.key,
    String? title, // Optional title for the screen.
    required List<Meal> meals, // List of meals to display.
  }) : _meals = meals, _title = title;

  final String? _title; // Title of the screen.
  final List<Meal> _meals; // List of meal objects.

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  bool _showImages = true; // Flag to toggle between image and list view.

  // Method to navigate to the meal details screen.
  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Default content when there are no meals.
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );

    // If there are meals, display them in a list or grid.
    if (widget._meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: widget._meals.length,
        itemBuilder: (ctx, index) {
          final meal = widget._meals[index];
          return _showImages
              ? MealItem(
                  meal: meal,
                  onSelectMeal: (meal) {
                    _selectMeal(context, meal);
                  },
                )
              : ListTile(
                  title: Text(meal.title),
                  subtitle: Text('${meal.duration} min - ${meal.complexityText} - ${meal.affordabilityText}'),
                  onTap: () {
                    _selectMeal(context, meal);
                  },
                );
        },
      );
    }

    // If there is no title, return the content directly.
    if (widget._title == null) {
      return content;
    }

    // Return a scaffold with an app bar and the content.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title!), // Title of the app bar.
        actions: [
          IconButton(
            icon: Icon(_showImages ? Icons.list : Icons.image), // Icon to toggle view.
            onPressed: () {
              setState(() {
                _showImages = !_showImages; // Toggle the view.
              });
            },
          ),
        ],
      ),
      body: content, // Body of the scaffold.
    );
  }
}