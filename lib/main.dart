// @dart=2.9

import './widgets/user_transaction.dart';
import "package:flutter/material.dart";

void main() => (runApp(MyApp()));

class MyApp extends StatelessWidget {
  // String title;
  // String amount;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Expenses")),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: Text("CHART!CHART!CHART!"),
                    elevation: 7,
                  )),
              UserTransaction(),
            ]),
      ),
    );
  }
}
