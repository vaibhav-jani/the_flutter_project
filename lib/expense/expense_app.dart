import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_flutter_project/expense/user_transactions.dart';

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget materialApp = MaterialApp(
      title: "Personal Expanses",
      home: const UserTransactions(),
      theme: getMaterialExpansesTheme(),
    );
    Widget cupertinoApp = const CupertinoApp(
      title: "Personal Expanses",
      home: UserTransactions(),
      color: Colors.purple,
    );
    //return Platform.isIOS ? cupertinoApp : materialApp;
    return materialApp;
  }

  CupertinoThemeData getCupertinoExpanseTheme() {
    return const CupertinoThemeData(
      primaryColor: Colors.purple,
    );
  }

  ThemeData getMaterialExpansesTheme() {
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
