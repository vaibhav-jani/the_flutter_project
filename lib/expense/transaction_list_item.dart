import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction _transaction;

  final Function(String id) _delete;

  const TransactionListItem(Key key, this._transaction, this._delete)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.error;
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${_transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(_transaction.date),
          style: Theme.of(context).textTheme.labelSmall,
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
          onPressed: () {
            _delete(_transaction.id);
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
            _delete(_transaction.id);
          },
        ),
      ),
    );
  }
}
