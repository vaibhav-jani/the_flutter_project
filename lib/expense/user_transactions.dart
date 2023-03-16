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
    //Transaction('t1', "New Shoes", 69.99, DateTime.now()),
    //Transaction('t2', "Weekly Groceries", 16.53, DateTime.now()),
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
    return Scaffold(
      appBar: AppBar(
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ExpanseChart(_recentTransactions),
          TransactionList(_userTransactions, _delete),
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
