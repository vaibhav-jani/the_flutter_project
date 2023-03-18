import 'package:flutter/material.dart';
import 'models/categories.dart';

class CategoryItem extends StatelessWidget {
  final Category _category;

  const CategoryItem(this._category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
