import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import '../models/categories.dart';

class CategoryItem extends StatelessWidget {
  final MealCategory _category;

  const CategoryItem(this._category, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(_category, context);
      },
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_category.color.withOpacity(0.7), _category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  void _selectCategory(
    MealCategory category,
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: category
    );
  }
}
