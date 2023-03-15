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
    // Transaction('t1', "New Shoes", 69.99, DateTime.now()),
    // Transaction('t2', "Weekly Groceries", 16.53, DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      DateTime.now().microsecond.toString(),
      title,
      amount,
      DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const ExpanseChart(),
          TransactionList(_userTransactions),
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
