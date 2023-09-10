import '../models/transaction.dart';

final List<Transaction> transactions = [
  Transaction(
    id: '1',
    title: 'New transaction',
    amount: 22.58,
    date: DateTime.now(),
  ),
  Transaction(
    id: '2',
    title: 'Mobile phone',
    amount: 10.5,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Transaction(
    id: '3',
    title: 'Key repairer',
    amount: 5.3,
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
];
