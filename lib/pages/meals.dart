import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  bool _showImages = true;

  void selectMeal(BuildContext context, Meal meal) {
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

    if (widget.meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (ctx, index) {
          final meal = widget.meals[index];
          return _showImages
              ? MealItem(
                  meal: meal,
                  onSelectMeal: (meal) {
                    selectMeal(context, meal);
                  },
                )
              : ListTile(
                  title: Text(meal.title),
                  subtitle: Text('${meal.duration} min - ${meal.complexityText} - ${meal.affordabilityText}'),
                  onTap: () {
                    selectMeal(context, meal);
                  },
                );
        },
      );
    }

    if (widget.title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        actions: [
          IconButton(
            icon: Icon(_showImages ? Icons.list : Icons.image),
            onPressed: () {
              setState(() {
                _showImages = !_showImages;
              });
            },
          ),
        ],
      ),
      body: content,
    );
  }
}