import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '.././models/transaction.dart';

import './widgets/transaction_creation_form.dart';
import './widgets/transactions_list.dart';
import './widgets/transactions_chart.dart';

import '../assets/constants.dart' as constants;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Quicksand',
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _handleAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: TransactionCreationForm(
                  addNewTransaction: _addNewTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Spending during the week.'),
        actions: [
          IconButton(
            onPressed: () => _handleAddTransaction(context),
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TransactionsChart(),
            TransactionsList(
              transactions: transactions,
            ),
            // Transactions(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleAddTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
