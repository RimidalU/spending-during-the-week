import 'package:flutter/material.dart';

class TransactionCreationForm extends StatelessWidget {
  final Function addNewTransaction;

  TransactionCreationForm({super.key, required this.addNewTransaction});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            TextButton(
              onPressed: () {
                addNewTransaction(
                  titleController.text,
                  double.tryParse(amountController.text),
                );
              },
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
