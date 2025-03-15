import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_type.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(2)
  final double amount;
  
  @HiveField(3)
  final DateTime date;
  
  @HiveField(4)
  final TransactionType type;
  
  @HiveField(5)
  final String? category;
  
  @HiveField(6)
  final String description;

  @HiveField(7)
  final DateTime createdAt;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.type,
    this.category,
    required this.description,
    required this.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    id: json['id'] as String,
    amount: json['amount'] as double,
    date: DateTime.parse(json['date'] as String),
    type: TransactionType.values[json['type'] as int],
    category: json['category'] as String?,
    description: json['description'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'date': date.toIso8601String(),
    'type': type.index,
    'category': category,
    'description': description,
    'createdAt': createdAt.toIso8601String(),
  };

  factory TransactionModel.fromEntity(Transaction transaction) {
    return TransactionModel(
      id: transaction.id,
      amount: transaction.amount,
      date: transaction.date,
      type: transaction.type,
      category: transaction.category,
      description: transaction.description,
      createdAt: transaction.createdAt,
    );
  }

  Transaction toEntity() {
    return Transaction(
      id: id,
      amount: amount,
      date: date,
      type: type,
      category: category,
      description: description,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [id, amount, date, type, category, description, createdAt];
}