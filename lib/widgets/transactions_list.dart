import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '.././models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((transaction) {
          return Card(
            elevation: 5,
            child: Row(children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                child: Text(
                  '\$${transaction.amount}',
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
                    transaction.title,
                  ),
                  Text(
                    style: const TextStyle(color: Colors.grey),
                    DateFormat.yMMMMEEEEd().format(transaction.date),
                  )
                ],
              )
            ]),
          );
        })
      ],
    );
  }
}
