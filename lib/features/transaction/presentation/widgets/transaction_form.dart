import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../domain/entities/transaction_type.dart';
import '../bloc/form/transaction_form_bloc.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController(text: '');
  final TextEditingController _descriptionController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();

  TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return BlocConsumer<TransactionFormBloc, TransactionFormState>(
      listenWhen: (pre, current) {
        return pre != current;
      },
      listener: (context, state) {
        _amountController.text = state.amount.toString();
        _amountController.selection = TextSelection.collapsed(
            offset: _amountController.text.length);
        _descriptionController.text = state.description ?? '';
        _descriptionController.selection = TextSelection.collapsed(
            offset: _descriptionController.text.length);
        
        // Reset form validation state when form is cleared
        if (state == TransactionFormState.initial()) {
          _formKey.currentState?.reset();
        }
      },
      buildWhen: (pre, next) {
        return pre != next;
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: l10n.amount,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  isDense: true,
                  labelStyle: const TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 16,
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixText: '\$',
                  prefixStyle: const TextStyle(
                    color: Color(0xFF424242),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 20,
                    bottom: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFF2E7D32),
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '0',
                  errorStyle: const TextStyle(
                    color: Color(0xFFE53935),
                    fontSize: 12,
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  context.read<TransactionFormBloc>()
                      .add(TransactionFormEvent.amountChanged(value));
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<TransactionType>(
                value: state.type,
                decoration: InputDecoration(
                  labelText: l10n.type,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  isDense: true,
                  labelStyle: const TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 16,
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 20,
                    bottom: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFF2E7D32),
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.category,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Color(0xFF2E7D32),
                  size: 28,
                ),
                style: const TextStyle(
                  color: Color(0xFF424242),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                dropdownColor: Colors.white,
                menuMaxHeight: 300,
                borderRadius: BorderRadius.circular(8),
                items: TransactionType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                            type == TransactionType.income 
                                ? Icons.arrow_upward 
                                : Icons.arrow_downward,
                            color: type == TransactionType.income
                                ? const Color(0xFF2E7D32)
                                : const Color(0xFFE53935),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            type == TransactionType.income ? l10n.income : l10n.expense,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) => context.read<TransactionFormBloc>()
                    .add(TransactionFormEvent.typeChanged(value!)),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: '${l10n.description}*',
                  hintText: l10n.descriptionHint,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  isDense: true,
                  labelStyle: const TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 16,
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 20,
                    bottom: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Color(0xFF2E7D32),
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.description,
                    color: Color(0xFF2E7D32),
                  ),
                ),
                maxLines: 1,
                onChanged: (value) {
                  context.read<TransactionFormBloc>()
                      .add(TransactionFormEvent.noteChanged(value));
                },
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: state.date,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Color(0xFF2E7D32),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (date != null) {
                    context.read<TransactionFormBloc>()
                        .add(TransactionFormEvent.dateChanged(date));
                  }
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: l10n.date,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    isDense: true,
                    labelStyle: const TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 16,
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xFF2E7D32),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 20,
                      bottom: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFF2E7D32),
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.calendar_today,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  child: Text(
                    DateFormat.yMd(Localizations.localeOf(context).languageCode).format(state.date),
                    style: const TextStyle(
                      color: Color(0xFF424242),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (state.error != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFEF9A9A),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Color(0xFFE53935),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          state.error!,
                          style: const TextStyle(
                            color: Color(0xFFE53935),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (state.error != null)
                const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<TransactionFormBloc>()
                        .add(const TransactionFormEvent.submitted());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.transactionAdded),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  l10n.save,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        );
      },
    );
  }
} 