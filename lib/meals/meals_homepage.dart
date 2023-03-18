import 'package:flutter/material.dart';
import 'categories_screen.dart';

class MealsHome extends StatefulWidget {
  const MealsHome({super.key});

  @override
  State<MealsHome> createState() => _MealsHomeState();
}

class _MealsHomeState extends State<MealsHome> {
  @override
  Widget build(BuildContext context) {
    return const CategoriesScreen();
  }
}
