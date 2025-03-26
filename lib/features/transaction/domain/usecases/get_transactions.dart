import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

@injectable
class GetTransactions implements UseCase<List<Transaction>, NoParams> {
  final TransactionRepository _repository;

  GetTransactions(this._repository);

  @override
  Future<Either<Failure, List<Transaction>>> call(NoParams params) {
    return _repository.getTransactions();
  }
}