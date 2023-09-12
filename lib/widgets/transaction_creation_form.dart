import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  DateTime? selectedDate;

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    final date = selectedDate ?? DateTime.now();

    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addNewTransaction(
      title,
      amount,
      date,
    );
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 7)),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

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
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMEd().format(selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    onPressed: presentDatePicker,
                    child: const Text(
                      'Choose Date',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
