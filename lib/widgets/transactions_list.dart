import 'package:flutter/material.dart';

import '.././models/transaction.dart';

import '.././widgets/transaction_card.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: transactions.isEmpty
          ? Center(
              child: Image.asset(
                'assets/images/no-content.png',
                fit: BoxFit.cover,
              ),
            )
          : ListView.builder(
              itemBuilder: (_, index) {
                return TransactionCard(
                  transactionAmount: transactions[index].amount,
                  transactionDate: transactions[index].date,
                  transactionTitle: transactions[index].title,
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
