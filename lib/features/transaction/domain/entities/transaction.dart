import 'package:equatable/equatable.dart';
import 'transaction_type.dart';

class Transaction extends Equatable {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionType type;
  final String? category;
  final String? note;

  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    this.category,
    this.note,
  });

  @override
  List<Object?> get props => [id, title, amount, date, type, category, note];
} 