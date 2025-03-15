import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/entities/transaction_type.dart';
import '../../../domain/repositories/transaction_repository.dart';

part 'transaction_form_bloc.freezed.dart';

// Events
@freezed
class TransactionFormEvent with _$TransactionFormEvent {
  const factory TransactionFormEvent.amountChanged(String amount) = AmountChanged;
  const factory TransactionFormEvent.typeChanged(TransactionType type) = TypeChanged;
  const factory TransactionFormEvent.dateChanged(DateTime date) = DateChanged;
  const factory TransactionFormEvent.noteChanged(String description) = NoteChanged;
  const factory TransactionFormEvent.submitted() = Submitted;
}

// State
@freezed
class TransactionFormState with _$TransactionFormState {
  const factory TransactionFormState({
    required String amount,
    required TransactionType type,
    required DateTime date,
    String? description,
    String? error,
  }) = _TransactionFormState;

  factory TransactionFormState.initial() => TransactionFormState(
        amount: '',
        description: '',
        type: TransactionType.expense,
        date: DateTime.now(),
      );
}

@singleton
class TransactionFormBloc extends Bloc<TransactionFormEvent, TransactionFormState> {
  final TransactionRepository _repository;
  final TransactionBloc _transactionBloc;
  final _uuid = const Uuid();

  TransactionFormBloc(this._repository, this._transactionBloc)
      : super(TransactionFormState.initial()) {
    on<TransactionFormEvent>((event, emit) async {
      await event.when(
        amountChanged: (amount) {
          emit(state.copyWith(amount: amount));
        },
        typeChanged: (type) {
          emit(state.copyWith(type: type));
        },
        dateChanged: (date) {
          emit(state.copyWith(date: date));
        },
        noteChanged: (description) {
          emit(state.copyWith(description: description));
        },
        submitted: () async {
          final double? amount = double.tryParse(state.amount);
          if (amount == null || amount <= 0) {
            emit(state.copyWith(error: 'Amount is invalid'));
            return;
          }

          if (state.description == null || state.description!.trim().isEmpty) {
            emit(state.copyWith(error: 'Description is required'));
            return;
          }

          print('TransactionFormBloc - Submitting transaction');
          final transaction = Transaction(
            id: _uuid.v4(),
            title: state.type == TransactionType.income ? 'Income' : 'Expense',
            amount: amount,
            date: state.date,
            type: state.type,
            description: state.description ?? '',
            createdAt: DateTime.now(),
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