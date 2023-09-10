import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';

const dayInWeek = 7;

class TransactionsChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const TransactionsChart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedInDayTransactionsValue {
    return List.generate(dayInWeek, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

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
