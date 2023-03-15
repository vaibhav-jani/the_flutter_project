import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String title, double amount) _addNewTransaction;

  const NewTransaction(this._addNewTransaction, {super.key});

  @override
  State<NewTransaction> createState() {
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  _addTransaction() {
    var title = titleController.value.text;
    var value = double.parse(amountController.value.text);
    if (title.isEmpty || value < 0) {
      return;
    }
    widget._addNewTransaction(
      title,
      value,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (text) {
                _addTransaction();
              },
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                _addTransaction();
              },
              child: const Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
