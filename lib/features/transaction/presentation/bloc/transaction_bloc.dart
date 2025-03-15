import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/usecases/get_transactions.dart';

part 'transaction_bloc.freezed.dart';

// Events
@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.started() = _Started;
  const factory TransactionEvent.refresh() = _Refresh;
}

// States
@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.loaded(List<Transaction> transactions) = _Loaded;
  const factory TransactionState.error(String message) = _Error;
}

// Bloc
@singleton
class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactions _getTransactions;

  TransactionBloc(this._getTransactions) : super(const TransactionState.initial()) {
    on<_Started>((event, emit) async {
      emit(const TransactionState.loading());
      final result = await _getTransactions(NoParams());
      result.fold(
        (failure) => emit(TransactionState.error(failure.message)),
        (transactions) => emit(TransactionState.loaded(transactions)),
      );
    });

    on<_Refresh>((event, emit) async {
      emit(const TransactionState.loading());
      final result = await _getTransactions(NoParams());
      result.fold(
        (failure) => emit(TransactionState.error(failure.message)),
        (transactions) => emit(TransactionState.loaded(transactions)),
      );
    });
  }
} 