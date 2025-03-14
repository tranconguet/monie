import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../models/transaction_model.dart';

abstract class TransactionLocalDataSource {
  Future<List<TransactionModel>> getTransactions();
  Future<TransactionModel?> getTransactionById(String id);
  Future<TransactionModel> createTransaction(TransactionModel transaction);
  Future<TransactionModel> updateTransaction(TransactionModel transaction);
  Future<void> deleteTransaction(String id);
}

@LazySingleton(as: TransactionLocalDataSource)
class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  static const String boxName = 'transactions';
  final Box<TransactionModel> _box;

  TransactionLocalDataSourceImpl() : _box = Hive.box<TransactionModel>(boxName);

  @override
  Future<List<TransactionModel>> getTransactions() async {
    return _box.values.toList();
  }

  @override
  Future<TransactionModel?> getTransactionById(String id) async {
    return _box.get(id);
  }

  @override
  Future<TransactionModel> createTransaction(TransactionModel transaction) async {
    await _box.put(transaction.id, transaction);
    return transaction;
  }

  @override
  Future<TransactionModel> updateTransaction(TransactionModel transaction) async {
    await _box.put(transaction.id, transaction);
    return transaction;
  }

  @override
  Future<void> deleteTransaction(String id) async {
    await _box.delete(id);
  }
} 