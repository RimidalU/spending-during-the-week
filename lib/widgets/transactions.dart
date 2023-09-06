import 'package:flutter/material.dart';

import '.././widgets/transaction_creation_form.dart';
import '.././widgets/transactions_list.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionCreationForm(),
        const TransactionsList(),
      ],
    );
  }
}
