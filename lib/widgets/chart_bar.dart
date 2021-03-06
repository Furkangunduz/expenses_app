import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  late final String label;
  late final double spendingAmount;
  late final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}")),
          SizedBox(
            height: 2,
          ),
          Container(
            width: 10,
            height: 60,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
                FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ))
              ],
            ),
          ),
          SizedBox(height: 2),
          Text(label)
        ],
      ),
    );
  }
}
