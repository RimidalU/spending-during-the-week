import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spending_during_the_week/widgets/transactions_list.dart';

import 'assets/constants.dart' as constants;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Spending during the week.'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            color: Colors.deepPurpleAccent,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: const Text('week chart'),
            ),
          ),
          Card(
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
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child: const Text('Add Transaction'),
                  )
                ],
              ),
            ),
          ),
          const TransactionsList(),
        ],
      ),
    );
  }
}
