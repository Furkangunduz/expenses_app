import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  late Function addTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

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
            ),
            TextField(
              // onChanged: (val) => amount = val,
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            ElevatedButton(
                onPressed: () => addTransaction(
                    titleController.text, double.parse(amountController.text)),
                child: Text("AddTransaction"))
          ],
        ),
      ),
    );
  }
}
