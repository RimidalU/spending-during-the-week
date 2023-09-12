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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
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

  final List<Transaction> _transactions = constants.transactions;

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
            (transaction) => transaction.date.isAfter(DateTime.now().subtract(
                  const Duration(days: 7),
                )))
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      id: uuid.v4(),
      title: title,
      amount: amount,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
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

  void _handleRemoveTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transaction) => transaction.id == id);
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
            TransactionsChart(
              recentTransactions: _transactions,
            ),
            TransactionsList(
              transactions: _recentTransactions,
              removeTransaction: _handleRemoveTransaction,
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
