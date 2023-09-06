import 'package:flutter/material.dart';

import '.././models/transaction.dart';

import '.././widgets/transaction_creation_form.dart';
import '.././widgets/transactions_list.dart';

import '../assets/constants.dart' as constants;

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> transactions = constants.transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionCreationForm(),
        TransactionsList(
          transactions: transactions,
        ),
      ],
    );
  }
}
