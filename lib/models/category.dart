import 'package:flutter/material.dart';

// This class represents a category with an id, title, and color.
class Category {
  // Constructor for the Category class.
  // It requires an id and a title, and has an optional color parameter with a default value of orange.
  const Category({
    required this.id, // The unique identifier for the category.
    required this.title, // The title or name of the category.
    this.color = Colors.orange, // The color associated with the category, defaulting to orange if not provided.
  });

  final String id; // A string that uniquely identifies the category.
  final String title; // The name or title of the category.
  final Color color; // The color associated with the category.
}