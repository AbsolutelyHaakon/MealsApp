import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:meals_app/models/meal.dart';

// A widget that represents a meal item.
class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal, // The meal to display.
    required this.onSelectMeal, // Callback when the meal is selected.
  });

  final Meal meal; // The meal object.
  final void Function(Meal meal) onSelectMeal; // Callback function for meal selection.

  // Getter to format the complexity text.
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  // Getter to format the affordability text.
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8), // Margin around the card.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners.
      ),
      clipBehavior: Clip.hardEdge, // Clip the content to the rounded corners.
      elevation: 2, // Elevation of the card.
      child: InkWell(
        onTap: () {
          onSelectMeal(meal); // Handle tap event.
        },
        child: Stack(
          children: [
            // Hero widget for image transition.
            Hero(
              tag: meal.id, // Unique tag for the hero animation.
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage), // Placeholder image.
                image: NetworkImage(meal.imageUrl), // Network image.
                fit: BoxFit.cover, // Cover the entire area.
                height: 200, // Fixed height.
                width: double.infinity, // Full width.
              ),
            ),
            // Positioned container for meal details.
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54, // Semi-transparent background.
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44), // Padding inside the container.
                child: Column(
                  children: [
                    // Meal title.
                    Text(
                      meal.title,
                      maxLines: 2, // Maximum of 2 lines.
                      textAlign: TextAlign.center, // Center align the text.
                      softWrap: true, // Wrap text if needed.
                      overflow: TextOverflow.ellipsis, // Ellipsis for overflow.
                      style: const TextStyle(
                        fontSize: 20, // Font size.
                        fontWeight: FontWeight.bold, // Bold text.
                        color: Colors.white, // White color.
                      ),
                    ),
                    const SizedBox(height: 12), // Spacing.
                    // Row for meal traits.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center align the row.
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule, // Icon for duration.
                          label: '${meal.duration} min', // Duration label.
                        ),
                        const SizedBox(width: 12), // Spacing.
                        MealItemTrait(
                          icon: Icons.work, // Icon for complexity.
                          label: complexityText, // Complexity label.
                        ),
                        const SizedBox(width: 12), // Spacing.
                        MealItemTrait(
                          icon: Icons.attach_money, // Icon for affordability.
                          label: affordabilityText, // Affordability label.
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}