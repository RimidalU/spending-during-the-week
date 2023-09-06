import 'package:flutter/material.dart';

class TransactionsChart extends StatelessWidget {
  const TransactionsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.deepPurpleAccent,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        child: const Text('week chart'),
      ),
    );
  }
}
