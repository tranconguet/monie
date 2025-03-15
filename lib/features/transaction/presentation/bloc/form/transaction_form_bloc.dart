import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/entities/transaction_type.dart';
import '../../../domain/repositories/transaction_repository.dart';

part 'transaction_form_bloc.freezed.dart';
part 'transaction_form_event.dart';
part 'transaction_form_state.dart';

@singleton
class TransactionFormBloc extends Bloc<TransactionFormEvent, TransactionFormState> {
  final TransactionRepository _repository;
  final TransactionBloc _transactionBloc;
  final _uuid = const Uuid();

  TransactionFormBloc(this._repository, this._transactionBloc)
      : super(TransactionFormState.initial()) {
    on<TransactionFormEvent>((event, emit) async {
      await event.when(
        amountChanged: (String value) {
          emit(state.copyWith(amount: value));
        },
        typeChanged: (TransactionType type) {
          emit(state.copyWith(type: type));
        },
        dateChanged: (DateTime date) {
          emit(state.copyWith(date: date));
        },
        submitted: () async {
          final double? amount = double.tryParse(state.amount);
          if (amount == null || amount <= 0) {
            emit(state.copyWith(error: 'Amount is invalid'));
            return;
          }

          print('TransactionFormBloc - Submitting transaction');
          final transaction = Transaction(
            id: _uuid.v4(),
            title: state.type == TransactionType.income ? 'Income' : 'Expense',
            amount: amount!,
            date: state.date,
            type: state.type,
          );

          final result = await _repository.createTransaction(transaction);

          result.fold(
            (failure) {
              print('TransactionFormBloc - Error creating transaction: ${failure.message}');
              emit(state.copyWith(error: failure.message));
            },
            (_) {
              print('TransactionFormBloc - Transaction created successfully, refreshing list');
              emit(TransactionFormState.initial());
              _transactionBloc.add(const TransactionEvent.refresh());
            },
          );
        },
      );
    });
  }
} 