import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  const TransactionList(this._userTransactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? getEmptyTransactionsPlaceHolder(context)
        : SizedBox(
            height: 300,
            child: ListView.builder(
              itemBuilder: (context, position) {
                return getTransactionCard(
                  _userTransactions.elementAt(position),
                  context,
                );
              },
              itemCount: _userTransactions.length,
            ),
          );
  }
}

Widget getEmptyTransactionsPlaceHolder(BuildContext context) {
  return Column(
    children: [
      const Padding(padding: EdgeInsets.all(16)),
      Text(
        "No transactions added yet!",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const Padding(padding: EdgeInsets.all(16)),
      SizedBox(
        height: 200,
        child: Image.asset(
          "assets/images/waiting.png",
          fit: BoxFit.cover,
        ),
      ),
      const Padding(padding: EdgeInsets.all(8)),
    ],
  );
}

Widget getTransactionCard(Transaction transaction, BuildContext context) {
  return Card(
    child: Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            '\$${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const Padding(padding: EdgeInsets.all(1)),
            Text(
              DateFormat.yMMMd().format(transaction.date),
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
