import 'package:flutter/material.dart';

class ExpanseChart extends StatelessWidget {
  const ExpanseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 4,
      child: const SizedBox(
        width: double.infinity,
        child: Text("CHART!"),
      ),
    );
  }
}
