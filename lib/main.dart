import 'package:flutter/material.dart';
import 'transaction.dart';

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
  final List<Transaction> transaction = [
    Transaction(
        id: '1', title: 'New transaction', amount: 22.58, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Mobile phone', amount: 10.5, date: DateTime.now()),
    Transaction(
        id: '3', title: 'Key repairer', amount: 5.3, date: DateTime.now()),
  ];

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: const Text('week chart'),
              )),
          // ),
          const Card(
            child: Text('list of transactions'),
          )
        ],
      ),
    );
  }
}
