import 'package:flutter/material.dart';
import '../models/dummy/dummy_meals.dart';

import '../models/categories.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as MealCategory;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
        ),
      ),
      body: _getCategoryBody(category),
    );
  }

  Widget _getCategoryBody(MealCategory category) {
    final categoryMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(category.id);
      },
    ).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
          return Text(categoryMeals[index].title);
      },
      itemCount: categoryMeals.length,
    );
  }
}
