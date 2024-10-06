import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/pages/tabs.dart';

// Define the theme for the application.
final theme = ThemeData(
  useMaterial3: true, // Enable Material 3 design.
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark, // Use a dark theme.
    seedColor: const Color.fromARGB(255, 131, 57, 0), // Seed color for the color scheme.
  ),
  textTheme: GoogleFonts.latoTextTheme(), // Use Lato font for text.
);

void main() {
  runApp(
    const ProviderScope(
      child: App(), // Root widget of the application.
    ),
  );
}

// Root widget of the application.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme, // Apply the defined theme.
      home: const TabsScreen(), // Set the home screen to TabsScreen.
      debugShowCheckedModeBanner: false, // Disable the debug banner.
    );
  }
}