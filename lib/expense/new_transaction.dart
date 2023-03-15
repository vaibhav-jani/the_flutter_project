import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String title, double amount, DateTime dateTime)
      _addNewTransaction;

  const NewTransaction(this._addNewTransaction, {super.key});

  @override
  State<NewTransaction> createState() {
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate = DateTime.now();

  _addTransaction() {
    var title = _titleController.value.text;
    var value = double.parse(_amountController.value.text);
    if (title.isEmpty || value < 0) {
      return;
    }
    widget._addNewTransaction(title, value, _pickedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value != null) {
          setState(
            () {
              _pickedDate = value;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              controller: _titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (text) {
                _addTransaction();
              },
            ),
            const Padding(padding: EdgeInsets.all(4)),
            Row(
              children: [
                //const Text('No date chosen !'),
                Text(DateFormat.yMMMd().format(_pickedDate)),
                TextButton(
                  onPressed: () {
                    _presentDatePicker();
                  },
                  child: const Text("Choose Date"),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _addTransaction();
              },
              child: const Text(
                "Add Transaction",
              ),
            )
          ],
        ),
      ),
    );
  }
}
