import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/transaction_repository.dart';

@injectable
class DeleteTransaction implements UseCase<void, String> {
  final TransactionRepository _repository;

  DeleteTransaction(this._repository);

  @override
  Future<Either<Failure, void>> call(String id) {
    return _repository.deleteTransaction(id);
  }
} 