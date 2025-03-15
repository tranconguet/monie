import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_type.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  final Animation<double> animation;

  const TransactionListItem({
    super.key,
    required this.transaction,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;

    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).chain(CurveTween(curve: Curves.easeOutCubic)),
          ),
          child: Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isIncome
                      ? const Color(0xFFE8F5E9)  // Light green
                      : const Color(0xFFFFEBEE), // Light red
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isIncome
                      ? const Color(0xFF2E7D32)  // Dark green
                      : const Color(0xFFE53935), // Dark red
                ),
              ),
              title: Text(
                transaction.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
              ),
              subtitle: Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Color(0xFF757575),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('yyyy-MM-dd').format(transaction.date),
                    style: const TextStyle(
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                '\$${transaction.amount}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isIncome
                      ? const Color(0xFF2E7D32)  // Dark green
                      : const Color(0xFFE53935), // Dark red
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} 