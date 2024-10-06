import 'package:flutter/material.dart';

// A widget that represents a trait of a meal item.
class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.icon, // The icon to display.
    required this.label, // The label to display.
  });

  final IconData icon; // The icon data.
  final String label; // The label text.

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon, // Display the icon.
          size: 17, // Set the size of the icon.
          color: Colors.white, // Set the color of the icon.
        ),
        const SizedBox(width: 6), // Add spacing between the icon and the label.
        Text(
          label, // Display the label text.
          style: const TextStyle(
            color: Colors.white, // Set the color of the text.
          ),
        ),
      ],
    );
  }
}