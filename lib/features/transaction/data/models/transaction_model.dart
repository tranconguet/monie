import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_type.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String title;
  
  @HiveField(2)
  final double amount;
  
  @HiveField(3)
  final DateTime date;
  
  @HiveField(4)
  final TransactionType type;
  
  @HiveField(5)
  final String? category;
  
  @HiveField(6)
  final String? note;

  @HiveField(7)
  final DateTime createdAt;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    this.category,
    this.note,
    required this.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    id: json['id'] as String,
    title: json['title'] as String,
    amount: json['amount'] as double,
    date: DateTime.parse(json['date'] as String),
    type: TransactionType.values[json['type'] as int],
    category: json['category'] as String?,
    note: json['note'] as String?,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'amount': amount,
    'date': date.toIso8601String(),
    'type': type.index,
    'category': category,
    'note': note,
    'createdAt': createdAt.toIso8601String(),
  };

  factory TransactionModel.fromEntity(Transaction transaction) {
    return TransactionModel(
      id: transaction.id,
      title: transaction.title,
      amount: transaction.amount,
      date: transaction.date,
      type: transaction.type,
      category: transaction.category,
      note: transaction.note,
      createdAt: transaction.createdAt,
    );
  }

  Transaction toEntity() {
    return Transaction(
      id: id,
      title: title,
      amount: amount,
      date: date,
      type: type,
      category: category,
      note: note,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [id, title, amount, date, type, category, note, createdAt];
}