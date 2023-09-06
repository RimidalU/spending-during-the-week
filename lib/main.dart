import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
          Column(
            children: [
              ...constants.transactions.map((transaction) {
                return Card(
                  child: Row(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 18,
                      ),
                      child: Text(
                        '\$${transaction.amount}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          transaction.title,
                        ),
                        Text(
                          style: const TextStyle(color: Colors.grey),
                          DateFormat.yMMMMEEEEd().format(transaction.date),
                        )
                      ],
                    )
                  ]),
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
