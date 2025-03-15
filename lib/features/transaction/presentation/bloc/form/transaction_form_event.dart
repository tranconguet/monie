part of 'transaction_form_bloc.dart';

@freezed
class TransactionFormEvent with _$TransactionFormEvent {
  const factory TransactionFormEvent.amountChanged(String amount) = _AmountChanged;
  const factory TransactionFormEvent.typeChanged(TransactionType type) = _TypeChanged;
  const factory TransactionFormEvent.dateChanged(DateTime date) = _DateChanged;
  const factory TransactionFormEvent.submitted() = _Submitted;
}