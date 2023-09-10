import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const dayInWeek = 7;

class TransactionsChart extends StatelessWidget {
  const TransactionsChart({super.key});

  List<Map<String, Object>> get groupedInDayTransactionsValue {
    return List.generate(dayInWeek, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      return {
        'day': DateFormat.E(weekDay),
        'amount': 9.99,
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
