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
      elevation: 5,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 18,
          ),
          child: Text(
            '\$${transactionAmount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              transactionTitle,
            ),
            Text(
              style: const TextStyle(color: Colors.grey),
              DateFormat.yMMMMEEEEd().format(transactionDate),
            )
          ],
        )
      ]),
    );
  }
}
