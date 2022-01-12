import 'package:flutter/material.dart';
import '../models/transaction.dart';

// ignore: import_of_legacy_library_into_null_safe
import "package:intl/intl.dart";

class TransactionList extends StatelessWidget {
  List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(children: [
        Column(
          children: _userTransactions.map((tx) {
            return Card(
              child: Row(
                children: [
                  // costs of things
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 3)),
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      '\$ ${tx.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple[300]),
                    ),
                  ),

                  // name and date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                          child: Text(
                            '${tx.title}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          child: Text(
                        DateFormat.yMd().format(tx.dateTime),
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ))
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
