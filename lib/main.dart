// @dart=2.9

import "./widgets/transaction_list.dart";
import "package:flutter/material.dart";
import "./models/transaction.dart";
import "./widgets/new_transactions.dart";
import "./widgets/chart.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter",
        theme: ThemeData(
            primarySwatch: Colors.green,
            accentColor: Colors.amber,
            fontFamily: "Quicksand"),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: "t1", title: "Book", amount: 15.99, dateTime: DateTime.now()),
    // Transaction(
    //     id: "t2", title: "shoes", amount: 99.99, dateTime: DateTime.now())
  ];

  List<Transaction> get recentTransaction {
    return _userTransactions.where((tx) {
      return tx.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        dateTime: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expenses"),
          actions: <Widget>[
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(recentTransaction),
              TransactionList(recentTransaction),
            ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          },
        ));
  }
}
