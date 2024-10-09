import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/pages/tabs.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

// Define the theme for the application.
// Used on evey screen.
ThemeData buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 174, 92, 239),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}

// Root widget of the application.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(),
      home: const TabsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}