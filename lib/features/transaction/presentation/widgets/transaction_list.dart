import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_type.dart';
import '../bloc/transaction_bloc.dart';
import 'transaction_list_item.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Transaction> _transactions = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionBloc, TransactionState>(
      listenWhen: (previous, current) {
        return current.maybeWhen(
          loaded: (_) => true,
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.whenOrNull(
          loaded: (newTransactions) {
            final sortedNewTransactions = newTransactions.toList()
              ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

            // Handle removals
            for (var i = _transactions.length - 1; i >= 0; i--) {
              final transaction = _transactions[i];
              if (!sortedNewTransactions.contains(transaction)) {
                final removedItem = transaction;
                _transactions.removeAt(i);
                _listKey.currentState?.removeItem(
                  i,
                  (context, animation) => TransactionListItem(
                    transaction: removedItem,
                    animation: animation,
                  ),
                  duration: const Duration(milliseconds: 300),
                );
              }
            }

            // Handle additions
            for (var i = 0; i < sortedNewTransactions.length; i++) {
              final transaction = sortedNewTransactions[i];
              if (!_transactions.contains(transaction)) {
                if (i >= _transactions.length) {
                  _transactions.add(transaction);
                  _listKey.currentState?.insertItem(
                    i,
                    duration: const Duration(milliseconds: 300),
                  );
                } else {
                  _transactions.insert(i, transaction);
                  _listKey.currentState?.insertItem(
                    i,
                    duration: const Duration(milliseconds: 300),
                  );
                }
              }
            }
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () {
            context.read<TransactionBloc>().add(const TransactionEvent.started());
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF2E7D32),
              ),
            );
          },
          loading: () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: Color(0xFF2E7D32),
                ),
                SizedBox(height: 16),
                Text(
                  'Loading transactions...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
          loaded: (transactions) {
            if (transactions.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.receipt_long_outlined,
                      size: 64,
                      color: Color(0xFFBDBDBD),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No transactions yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF757575),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Add your first transaction above',
                      style: TextStyle(
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                  ],
                ),
              );
            }

            return AnimatedList(
              key: _listKey,
              initialItemCount: _transactions.length,
              itemBuilder: (context, index, animation) {
                return TransactionListItem(
                  transaction: _transactions[index],
                  animation: animation,
                );
              },
            );
          },
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Color(0xFFE53935),
                  size: 64,
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFFE53935),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<TransactionBloc>()
                        .add(const TransactionEvent.started());
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try Again'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    backgroundColor: const Color(0xFF2E7D32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 