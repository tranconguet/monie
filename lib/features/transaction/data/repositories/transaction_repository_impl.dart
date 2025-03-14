import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_type.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_local_datasource.dart';
import '../models/transaction_model.dart';

@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource _localDataSource;

  TransactionRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() async {
    try {
      final transactions = await _localDataSource.getTransactions();
      return Right(transactions.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Transaction>> getTransactionById(String id) async {
    try {
      final transaction = await _localDataSource.getTransactionById(id);
      if (transaction == null) {
        return Left(CacheFailure(message: 'Transaction not found'));
      }
      return Right(transaction.toEntity());
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Transaction>> createTransaction(Transaction transaction) async {
    try {
      final model = TransactionModel.fromEntity(transaction);
      final createdTransaction = await _localDataSource.createTransaction(model);
      return Right(createdTransaction.toEntity());
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Transaction>> updateTransaction(Transaction transaction) async {
    try {
      final model = TransactionModel.fromEntity(transaction);
      final updatedTransaction = await _localDataSource.updateTransaction(model);
      return Right(updatedTransaction.toEntity());
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTransaction(String id) async {
    try {
      await _localDataSource.deleteTransaction(id);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, double>> getTotalBalance() async {
    try {
      final transactions = await _localDataSource.getTransactions();
      final total = transactions.fold<double>(0, (sum, transaction) {
        return sum + (transaction.type == TransactionType.income
            ? transaction.amount
            : -transaction.amount);
      });
      return Right(total);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, double>> getTotalIncome() async {
    try {
      final transactions = await _localDataSource.getTransactions();
      final total = transactions
          .where((t) => t.type == TransactionType.income)
          .fold<double>(0, (sum, transaction) => sum + transaction.amount);
      return Right(total);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, double>> getTotalExpense() async {
    try {
      final transactions = await _localDataSource.getTransactions();
      final total = transactions
          .where((t) => t.type == TransactionType.expense)
          .fold<double>(0, (sum, transaction) => sum + transaction.amount);
      return Right(total);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
} 