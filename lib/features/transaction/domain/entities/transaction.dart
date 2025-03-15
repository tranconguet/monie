import 'package:equatable/equatable.dart';
import 'transaction_type.dart';

class Transaction extends Equatable {
  final String id;
  final double amount;
  final DateTime date;
  final TransactionType type;
  final String? category;
  final String description;
  final DateTime createdAt;

  const Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.type,
    this.category,
    required this.description,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, amount, date, type, category, description, createdAt];
} 