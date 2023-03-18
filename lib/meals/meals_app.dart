import 'package:flutter/material.dart';
import 'category_meals_screen.dart';
import 'categories_screen.dart';

class MealsApp extends StatelessWidget {

  const MealsApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: getMealsTheme(),
      routes: {
        '/': (context) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen()
      },
    );
  }
}

ThemeData getMealsTheme() {
  return ThemeData(
    primarySwatch: Colors.pink,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.pink,
      secondary: Colors.amber,
    ),
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodySmall: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          titleLarge: const TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            fontSize: 22,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
  );
}
