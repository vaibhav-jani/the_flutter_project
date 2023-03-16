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
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
    ),
  );
}

Widget getTransactionCard(
    Function(String id) delete, Transaction transaction, BuildContext context) {
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
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        color: Theme.of(context).colorScheme.error,
        onPressed: () {
          delete(transaction.id);
        },
      ),
    ),
  );
}
