import 'package:flutter/material.dart';
import 'package:the_flutter_project/expense/transaction_list_item.dart';
import 'models/transaction.dart';

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
                return TransactionListItem(
                  ValueKey(_userTransactions.elementAt(position).id),
                  _userTransactions.elementAt(position),
                  _delete,
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
