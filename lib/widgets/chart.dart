import 'package:expenses_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].dateTime.day == weekDay.day &&
            recentTransaction[i].dateTime.month == weekDay.month) {
          totalSum += recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return ChartBar(data["day"].toString(), data["amount"] as double,
                (data['amount'] as double) / 100);
          }).toList(),
        ),
      ),
    );
  }
}
