import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_type.dart';

class _DeleteButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _DeleteButton({
    required this.onPressed,
  });

  @override
  State<_DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<_DeleteButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: IconButton(
        icon: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: isHovered ? const Color(0xFFE53935) : const Color(0xFF757575),
          ),
          child: Icon(
            Icons.delete_outline_rounded,
            size: 20,
            color: isHovered ? const Color(0xFFE53935) : const Color(0xFF757575),
          ),
        ),
        splashRadius: 24,
        tooltip: 'Delete transaction',
        onPressed: widget.onPressed,
        hoverColor: const Color(0xFFFFEBEE),
      ),
    );
  }
}

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  final Animation<double> animation;
  final VoidCallback? onDelete;

  const TransactionListItem({
    super.key,
    required this.transaction,
    required this.animation,
    this.onDelete,
  });

  Future<bool> _showDeleteConfirmation(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: const [
              Icon(
                Icons.warning_amber_rounded,
                color: Color(0xFFE53935),
                size: 24,
              ),
              SizedBox(width: 12),
              Text(
                'Delete Transaction',
                style: TextStyle(
                  color: Color(0xFF424242),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          content: const Text(
            'Are you sure you want to delete this transaction? This action cannot be undone.',
            style: TextStyle(
              color: Color(0xFF757575),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                backgroundColor: const Color(0xFFFFEBEE),
                foregroundColor: const Color(0xFFE53935),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Delete',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    ) ?? false;
  }

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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${NumberFormat('#,###.##').format(transaction.amount)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isIncome
                          ? const Color(0xFF2E7D32)  // Dark green
                          : const Color(0xFFE53935), // Dark red
                    ),
                  ),
                  if (onDelete != null)
                    _DeleteButton(
                      onPressed: () async {
                        if (await _showDeleteConfirmation(context)) {
                          onDelete?.call();
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 