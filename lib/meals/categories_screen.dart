import 'package:flutter/cupertino.dart';
import 'package:the_flutter_project/meals/models/dummy/dummy_categories.dart';

import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
