import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  late Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransaction(titleController.text, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              // onChanged: (val) => title = val,
              decoration: InputDecoration(labelText: "title"),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              // onChanged: (val) => amount = val,
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              //onSubmit textfieldden gelen stringi gönderiyor kullanmasan bile kabul etmen gerek
              onSubmitted: (_) => submitData(),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text("AddTransaction"),
            )
          ],
        ),
      ),
    );
  }
}
