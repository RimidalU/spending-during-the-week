import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';

import './chart_bar.dart';

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
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedInDayTransactionsValue.fold(0.0, (sum, element) {
      return sum + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedInDayTransactionsValue.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'].toString(),
                spendingAmount: data['amount'] as double,
                spendingPercentOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
