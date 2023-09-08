import 'package:flutter/material.dart';

class TransactionCreationForm extends StatefulWidget {
  final Function addNewTransaction;

  const TransactionCreationForm({super.key, required this.addNewTransaction});

  @override
  State<TransactionCreationForm> createState() =>
      _TransactionCreationFormState();
}

class _TransactionCreationFormState extends State<TransactionCreationForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void submitData() {
      final title = titleController.text;
      final amount = double.parse(amountController.text);

      if (title.isEmpty || amount <= 0) {
        return;
      }
      widget.addNewTransaction(
        title,
        amount,
      );
      Navigator.of(context).pop();
    }

    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
