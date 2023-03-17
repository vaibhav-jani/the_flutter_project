import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_flutter_project/expense/chart_bar.dart';

import 'models/transaction.dart';



class ExpanseChart extends StatelessWidget {
  final List<Transaction> _userTransactions;

  const ExpanseChart(this._userTransactions, {super.key});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        {
          final weekDay = DateTime.now().subtract(Duration(days: index));
          double totalSum = 0.0;
          for (var i = 0; i < _userTransactions.length; i++) {
            DateTime transactionDay = _userTransactions[i].date;
            if (transactionDay.day == weekDay.day &&
                transactionDay.month == weekDay.month &&
                transactionDay.year == weekDay.year) {
              totalSum += _userTransactions[i].amount;
            }
          }
          var weekDayFormat = DateFormat.E().format(weekDay).substring(0, 1);
          return {'day': weekDayFormat, 'amount': totalSum};
        }
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
      0.0,
      (sum, item) {
        return sum + (item['amount'] as double);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map(
            (data) {
              double amount = data['amount'] as double;
              double spendingPctOfTotal =
                  (totalSpending == 0) ? 0 : amount / totalSpending;
              String label = data['day'] as String;
              return Flexible(
                fit: FlexFit.tight,
                child: Chartbar(
                  label,
                  amount,
                  spendingPctOfTotal,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
