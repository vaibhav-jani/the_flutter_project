import 'package:flutter/material.dart';
import 'package:the_flutter_project/expense/user_transactions.dart';

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expanses",
      home: const UserTransactions(),
      theme: getExpansesTheme(),
    );
  }

  ThemeData getExpansesTheme() {
    return ThemeData(
      primarySwatch: Colors.purple,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.purple,
        secondary: Colors.amber,
      ),
      fontFamily: 'Quicksand',
      textTheme: const TextTheme(),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
