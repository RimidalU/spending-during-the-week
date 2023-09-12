import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Function removeTransaction;

  final double transactionAmount;
  final String transactionTitle;
  final DateTime transactionDate;
  final String transactionId;

  const TransactionCard({
    super.key,
    required this.transactionAmount,
    required this.transactionDate,
    required this.transactionTitle,
    required this.transactionId,
    required this.removeTransaction,
  });

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
        trailing: IconButton(
            color: Theme.of(context).colorScheme.error,
            onPressed: () => removeTransaction(transactionId),
            icon: const Icon(
              Icons.delete,
            )),
      ),
    );
  }
}
