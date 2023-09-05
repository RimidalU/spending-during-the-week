import 'package:flutter/material.dart';
import 'transaction.dart';

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
          Column(
            children: [
              ...constants.transactions.map((transaction) {
                return Card(
                    child: Row(children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.black12,
                      child: Text(transaction.amount.toString())),
                  Column(
                    children: [
                      Text(transaction.title),
                      Text(transaction.date.toString())
                    ],
                  )
                ]));
              })
            ],
          )
        ],
      ),
    );
  }
}
