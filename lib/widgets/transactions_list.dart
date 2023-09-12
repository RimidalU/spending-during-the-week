import 'package:flutter/material.dart';

import '.././models/transaction.dart';

import '.././widgets/transaction_card.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  const TransactionsList({
    super.key,
    required this.transactions,
    required this.removeTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 515,
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
                  removeTransaction: removeTransaction,
                  transactionId: transactions[index].id,
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
