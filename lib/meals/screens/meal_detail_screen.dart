import 'package:flutter/material.dart';
import 'package:the_flutter_project/meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
        ),
      ),
      body: _getMealBody(meal, context),
    );
  }

  Widget _getMealBody(
    Meal meal,
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          _buildSectionTitle('Ingredients', context),
          _buildListContainer(
            ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Text(meal.ingredients[index]),
                  ),
                );
              },
              itemCount: meal.ingredients.length,
            ),
            context,
          ),
          _buildSectionTitle('Steps', context),
          _buildListContainer(
            ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(
                        meal.steps[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
              itemCount: meal.steps.length,
            ),
            context,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
        ));
  }

  Widget _buildListContainer(
    ListView listView,
    BuildContext context,
  ) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: listView,
    );
  }
}
