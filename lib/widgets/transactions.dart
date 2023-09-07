import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

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
  var uuid = const Uuid();

  final List<Transaction> transactions = constants.transactions;

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: uuid.v4(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionCreationForm(addNewTransaction: _addNewTransaction),
        TransactionsList(
          transactions: transactions,
        ),
      ],
    );
  }
}
