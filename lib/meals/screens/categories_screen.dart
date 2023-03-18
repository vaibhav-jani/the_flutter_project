import 'package:flutter/material.dart';
import '../models/dummy/dummy_categories.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          "DeliMeals",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
        ),
      ),*/
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (category) => CategoryItem(category),
          )
          .toList(),
    );
  }
}
