import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adaptive_flatbutton.dart';
import './adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) return;

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null)
      return;

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null)
        return;
      else
        setState(() {
          _selectedDate = date;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(),
                  onSubmitted: (_) => _submitData(),
                  decoration: InputDecoration(labelText: 'Amount'),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(_selectedDate == null
                            ? 'No date chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                      ),
                      AdaptiveFlatButton('Choose date', _presentDatePicker),
                    ],
                  ),
                ),
                AdaptiveButton('Add transaction', _submitData),
              ]),
        ),
      ),
    );
  }
}
