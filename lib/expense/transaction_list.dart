import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  final Function(String id) _delete;

  const TransactionList(this._userTransactions, this._delete, {super.key});

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? getEmptyTransactionsPlaceHolder(context)
        : Container(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemBuilder: (context, position) {
                return getTransactionCard(
                  _delete,
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
  return LayoutBuilder(
    builder: (context, constrains) {
      return Padding(
        padding: EdgeInsets.all(constrains.maxHeight * 0.05),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(constrains.maxHeight * 0.05)),
            SizedBox(
              height: constrains.maxHeight * 0.1,
              child: Text(
                "No transactions added yet!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(padding: EdgeInsets.all(constrains.maxHeight * 0.01)),
            SizedBox(
              height: constrains.maxHeight * 0.4,
              child: Image.asset(
                "assets/images/waiting.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(padding: EdgeInsets.all(constrains.maxHeight * 0.05)),
          ],
        ),
      );
    },
  );
}

Widget getTransactionCard(
    Function(String id) delete, Transaction transaction, BuildContext context) {
  final errorColor = Theme.of(context).colorScheme.error;
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: FittedBox(
            child: Text('\$${transaction.amount}'),
          ),
        ),
      ),
      title: Text(
        transaction.title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(transaction.date),
        style: Theme.of(context).textTheme.labelSmall,
      ),
      trailing: MediaQuery.of(context).size.width > 360
          ? TextButton.icon(
              onPressed: () {
                delete(transaction.id);
              },
              icon: Icon(
                Icons.delete,
                color: errorColor,
              ),
              label: Text(
                "Delete",
                style: TextStyle(color: errorColor),
              ),
            )
          : IconButton(
              icon: const Icon(Icons.delete),
              color: errorColor,
              onPressed: () {
                delete(transaction.id);
              },
            ),
    ),
  );
}
