import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final double transactionAmount;
  final String transactionTitle;
  final DateTime transactionDate;

  const TransactionCard(
      {super.key,
      required this.transactionAmount,
      required this.transactionDate,
      required this.transactionTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('\$${transactionAmount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          transactionTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMMEEEEd().format(transactionDate),
        ),
      ),
    );
  }
}
