import 'package:flutter/material.dart';
import 'package:the_flutter_project/meals/categories_screen.dart';

class MealsHome extends StatefulWidget {
  const MealsHome({super.key});

  @override
  State<MealsHome> createState() => _MealsHomeState();
}

class _MealsHomeState extends State<MealsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DeliMeals"),
      ),
      body: const CategoriesScreen(),
    );
  }
}
