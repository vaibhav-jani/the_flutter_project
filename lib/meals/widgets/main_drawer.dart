import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _menu(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed(
                "/",
              );
            },
          ),
          _menu(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(
                FiltersScreen.routeName,
              );
            },
          )
        ],
      ),
    );
  }

  Widget _menu(
    String title,
    IconData icon,
    Function onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
