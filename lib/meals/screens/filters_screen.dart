import 'package:flutter/material.dart';
import 'package:the_flutter_project/meals/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
        ),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text('Filters Screen!'),
      ),
    );
  }
}
