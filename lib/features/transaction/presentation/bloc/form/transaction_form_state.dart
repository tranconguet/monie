part of 'transaction_form_bloc.dart';

@freezed
class TransactionFormState with _$TransactionFormState {
  const factory TransactionFormState({
    required String amount,
    required TransactionType type,
    required DateTime date,
    required String note,
    String? error,
  }) = _TransactionFormState;

  factory TransactionFormState.initial() => TransactionFormState(
    amount: '',
    type: TransactionType.expense,
    date: DateTime.now(),
    note: ''
  );
} 