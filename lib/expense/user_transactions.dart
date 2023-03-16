import 'dart:core';

import 'package:flutter/material.dart';
import 'expanse_chart.dart';
import 'models/Transaction.dart';
import 'transaction_list.dart';
import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UserTransactionsState();
  }
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction('t1', "New Shoes", 10.0, DateTime.now()),
    Transaction('t2', "Weekly Groceries", 20.0, DateTime.now()),
    Transaction('t3', "Weekly Groceries", 30.00, DateTime.now()),
    Transaction('t4', "Weekly Groceries", 40.00, DateTime.now()),
    Transaction('t5', "Weekly Groceries", 50.00, DateTime.now()),
    Transaction('t6', "Weekly Groceries", 60.00, DateTime.now()),
    Transaction('t7', "Weekly Groceries", 70.00, DateTime.now()),
    Transaction('t8', "Weekly Groceries", 80.00, DateTime.now()),
    Transaction('t9', "Weekly Groceries", 90.00, DateTime.now()),
    Transaction('t10', "Weekly Groceries", 100.00, DateTime.now()),
    Transaction('t11', "Weekly Groceries", 110.00, DateTime.now()),
    Transaction('t12', "Weekly Groceries", 120.00, DateTime.now()),
    Transaction('t13', "Weekly Groceries", 130.00, DateTime.now()),
    Transaction('t14', "Weekly Groceries", 140.00, DateTime.now()),
    Transaction('t15', "Weekly Groceries", 150.00, DateTime.now()),
    Transaction('t16', "Weekly Groceries", 160.00, DateTime.now()),
    Transaction('t17', "Weekly Groceries", 170.00, DateTime.now()),
    Transaction('t18', "Weekly Groceries", 180.00, DateTime.now()),
    Transaction('t19', "Weekly Groceries", 190.00, DateTime.now()),
    Transaction('t20', "Weekly Groceries", 200.00, DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount, DateTime dateTime) {
    final newTx = Transaction(
      DateTime.now().microsecond.toString(),
      title,
      amount,
      dateTime,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _delete(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      DateTime target = DateTime.now().subtract(const Duration(days: 7));
      return tx.date.isAfter(target);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: const Text(
          "Personal Expanses",
          style: TextStyle(fontFamily: 'Open Sans'),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: const Icon(Icons.add),
          )
        ]);

    var padding = MediaQuery.of(context).padding;
    var screenHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
    var appBarHeight = appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              height: (screenHeight - appBarHeight) * 0.3,
              child: ExpanseChart(_recentTransactions)),
          SizedBox(
              height: (screenHeight - appBarHeight) * 0.7,
              child: TransactionList(_userTransactions, _delete)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }
}
