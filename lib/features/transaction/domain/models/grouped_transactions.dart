import 'package:money_manager/features/transaction/domain/entities/transaction_type.dart';

import '../entities/transaction.dart';

class GroupedTransactions {
  final String title;
  final List<Transaction> transactions;
  final double total;

  GroupedTransactions({
    required this.title,
    required this.transactions,
    required this.total,
  });

  factory GroupedTransactions.fromTransactions(String title, List<Transaction> transactions) {
    final total = transactions.fold<double>(
      0,
      (sum, transaction) => sum + (transaction.type == TransactionType.income ? transaction.amount : -transaction.amount),
    );

    return GroupedTransactions(
      title: title,
      transactions: transactions,
      total: total,
    );
  }
} 