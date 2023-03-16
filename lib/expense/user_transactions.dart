import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
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

  bool _showChart = true;

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = const Text(
      "Personal Expanses",
      style: TextStyle(fontFamily: 'Open Sans'),
    );
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: titleWidget,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _startAddNewTransaction(context);
                  },
                  child: const Icon(CupertinoIcons.add),
                )
              ],
            ),
          )
        : AppBar(
            title: titleWidget,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  _startAddNewTransaction(context);
                },
                icon: const Icon(Icons.add),
              )
            ],
          )) as PreferredSizeWidget;

    final mediaQuery = MediaQuery.of(context);
    final padding = mediaQuery.padding;
    final screenHeight = mediaQuery.size.height - padding.top - padding.bottom;
    final appBarHeight = appBar.preferredSize.height;
    final availableHeight = (screenHeight - appBarHeight);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;

    final transactionListWidget = SizedBox(
        height: availableHeight * 0.7,
        child: TransactionList(_userTransactions, _delete));

    final expanseChartWidget = SizedBox(
      height: availableHeight * (isLandScape ? 0.7 : 0.3),
      child: ExpanseChart(_recentTransactions),
    );

    final showChartSwitchWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Show Chart",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Switch.adaptive(
          activeColor: Theme.of(context).colorScheme.secondary,
          value: _showChart,
          onChanged: (value) {
            setState(() {
              _showChart = value;
            });
          },
        )
      ],
    );

    final bodyWidget = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (isLandScape) showChartSwitchWidget,
            if (isLandScape)
              (_showChart) ? expanseChartWidget : transactionListWidget,
            if (!isLandScape) expanseChartWidget,
            if (!isLandScape) transactionListWidget
          ],
        ),
      ),
    );

    final fabWidget = Platform.isIOS
        ? Container()
        : FloatingActionButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            child: const Icon(Icons.add),
          );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget,
            child: bodyWidget,
          )
        : Scaffold(
            appBar: appBar,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: bodyWidget,
            floatingActionButton: fabWidget,
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
