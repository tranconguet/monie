import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/transaction_type.dart';
import '../bloc/transaction_bloc.dart';
import '../bloc/form/transaction_form_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Money Manager'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _TransactionForm(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      context.read<TransactionBloc>()
                          .add(const TransactionEvent.refresh());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _TransactionList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransactionForm extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionFormBloc, TransactionFormState>(
      listenWhen: (pre, current) {
        return pre.amount != current.amount;
      },
      listener: (context, state) {
        _amountController.text = state.amount.toString();
        _amountController.selection = TextSelection.collapsed(
            offset: _amountController.text.length);
      },
      buildWhen: (pre, next) {
        return true;
      },
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    context.read<TransactionFormBloc>()
                        .add(TransactionFormEvent.amountChanged(value));
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<TransactionType>(
                  value: state.type,
                  decoration: const InputDecoration(
                    labelText: 'Type',
                  ),
                  items: TransactionType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.name),
                    );
                  }).toList(),
                  onChanged: (value) => context.read<TransactionFormBloc>()
                      .add(TransactionFormEvent.typeChanged(value!)),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: state.date,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      context.read<TransactionFormBloc>()
                          .add(TransactionFormEvent.dateChanged(date));
                    }
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Date',
                    ),
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(state.date),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (state.error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      state.error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () => context.read<TransactionFormBloc>()
                      .add(const TransactionFormEvent.submitted()),
                  child: const Text('Add Transaction'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            // Trigger loading of transactions when in initial state
            context.read<TransactionBloc>().add(const TransactionEvent.started());
            return const Center(child: CircularProgressIndicator());
          },
          loading: () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading transactions...'),
              ],
            ),
          ),
          loaded: (transactions) {
            if (transactions.isEmpty) {
              return const Center(child: Text('No transactions yet'));
            }
            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Card(
                  child: ListTile(
                    leading: Icon(
                      transaction.type == TransactionType.income
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: transaction.type == TransactionType.income
                          ? Colors.green
                          : Colors.red,
                    ),
                    title: Text(transaction.title),
                    subtitle: Text(DateFormat('yyyy-MM-dd').format(transaction.date)),
                    trailing: Text(
                      '\$${transaction.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: transaction.type == TransactionType.income
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            );
          },
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<TransactionBloc>()
                        .add(const TransactionEvent.started());
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 