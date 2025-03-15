import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_type.dart';
import '../../domain/models/grouped_transactions.dart';
import '../group_by_type.dart';
import 'transaction_list_item.dart';

class GroupedTransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final GroupByType groupByType;

  const GroupedTransactionList({
    super.key,
    required this.transactions,
    required this.groupByType,
  });

  @override
  State<GroupedTransactionList> createState() => _GroupedTransactionListState();
}

class _GroupedTransactionListState extends State<GroupedTransactionList> {
  late List<GroupedTransactions> _groupedTransactions;

  @override
  void initState() {
    super.initState();
    _updateGroups();
  }

  @override
  void didUpdateWidget(GroupedTransactionList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.transactions != widget.transactions ||
        oldWidget.groupByType != widget.groupByType) {
      _updateGroups();
    }
  }

  void _updateGroups() {
    final groups = <String, List<Transaction>>{};

    // Sort transactions by date first
    final sortedTransactions = widget.transactions.toList()
      ..sort((a, b) => b.date.compareTo(a.date));

    switch (widget.groupByType) {
      case GroupByType.type:
        for (final transaction in sortedTransactions) {
          final type = transaction.type.name;
          groups.putIfAbsent(type, () => []).add(transaction);
        }
        break;
      case GroupByType.day:
        for (final transaction in sortedTransactions) {
          final day = DateFormat('yyyy-MM-dd').format(transaction.date);
          groups.putIfAbsent(day, () => []).add(transaction);
        }
        break;
      case GroupByType.month:
        for (final transaction in sortedTransactions) {
          final month = DateFormat('MMMM yyyy').format(transaction.date);
          groups.putIfAbsent(month, () => []).add(transaction);
        }
        break;
      case GroupByType.year:
        for (final transaction in sortedTransactions) {
          final year = DateFormat('yyyy').format(transaction.date);
          groups.putIfAbsent(year, () => []).add(transaction);
        }
        break;
    }

    _groupedTransactions = groups.entries
        .map((entry) => GroupedTransactions.fromTransactions(entry.key, entry.value))
        .toList();

    // Sort groups by date or type
    if (widget.groupByType == GroupByType.type) {
      _groupedTransactions.sort((a, b) {
        final aIsIncome = a.transactions.first.type == TransactionType.income;
        final bIsIncome = b.transactions.first.type == TransactionType.income;
        return bIsIncome == aIsIncome ? 1 : -1; // TODO
      });
    } else {
      _groupedTransactions.sort((a, b) {
        final aDate = a.transactions.first.date;
        final bDate = b.transactions.first.date;
        return bDate.compareTo(aDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.transactions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color: Color(0xFFBDBDBD),
            ),
            SizedBox(height: 16),
            Text(
              'No transactions yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF757575),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Add your first transaction above',
              style: TextStyle(
                color: Color(0xFF9E9E9E),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _groupedTransactions.length,
      itemBuilder: (context, groupIndex) {
        final group = _groupedTransactions[groupIndex];
        final isIncomeGroup = group.transactions.first.type == TransactionType.income;
        final isTypeGroup = widget.groupByType == GroupByType.type;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (isTypeGroup)
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isIncomeGroup
                                ? const Color(0xFFE8F5E9)
                                : const Color(0xFFFFEBEE),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            isIncomeGroup
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: isIncomeGroup
                                ? const Color(0xFF2E7D32)
                                : const Color(0xFFE53935),
                            size: 16,
                          ),
                        ),
                      if (isTypeGroup) const SizedBox(width: 8),
                      if (!isTypeGroup)
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Color(0xFF757575),
                        ),
                      if (!isTypeGroup) const SizedBox(width: 8),
                      Text(
                        group.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$${group.total.abs().toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: group.total >= 0
                          ? const Color(0xFF2E7D32)
                          : const Color(0xFFE53935),
                    ),
                  ),
                ],
              ),
            ),
            ...group.transactions.map((transaction) {
              return TransactionListItem(
                transaction: transaction,
                animation: const AlwaysStoppedAnimation(1),
              );
            }),
            if (groupIndex < _groupedTransactions.length - 1)
              const Divider(height: 32),
          ],
        );
      },
    );
  }
} 