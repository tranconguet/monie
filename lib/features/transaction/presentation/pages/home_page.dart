import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/transaction_type.dart';
import '../bloc/transaction_bloc.dart';
import '../bloc/form/transaction_form_bloc.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool _isFormExpanded = true;
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic,
    );
    if (_isFormExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleForm() {
    setState(() {
      _isFormExpanded = !_isFormExpanded;
      if (_isFormExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: const Color(0xFFE53935),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Money Manager',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFF2E7D32), // Dark green
          foregroundColor: Colors.white,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF5F5F5), // Light grey
                Colors.white,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: _toggleForm,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              AnimatedRotation(
                                turns: _isFormExpanded ? 0.125 : 0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOutCubic,
                                child: const Icon(
                                  Icons.add_circle,
                                  color: Color(0xFF2E7D32),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'New Transaction',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF424242),
                                ),
                              ),
                              const Spacer(),
                              AnimatedRotation(
                                turns: _isFormExpanded ? 0.5 : 0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOutCubic,
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFF757575),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRect(
                        child: SizeTransition(
                          sizeFactor: _animation,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: _TransactionForm(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.sort,
                          color: Color(0xFF2E7D32),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Group by:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF424242),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: 'type',
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                  color: Color(0xFF2E7D32),
                                  width: 2,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Color(0xFF2E7D32),
                              size: 24,
                            ),
                            style: const TextStyle(
                              color: Color(0xFF424242),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            dropdownColor: Colors.white,
                            menuMaxHeight: 300,
                            borderRadius: BorderRadius.circular(6),
                            items: const [
                              DropdownMenuItem(
                                value: 'type',
                                child: Text('Type'),
                              ),
                              DropdownMenuItem(
                                value: 'day',
                                child: Text('Day'),
                              ),
                              DropdownMenuItem(
                                value: 'month',
                                child: Text('Month'),
                              ),
                              DropdownMenuItem(
                                value: 'year',
                                child: Text('Year'),
                              ),
                            ],
                            onChanged: (value) {
                              // Will implement grouping logic later
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.receipt_long,
                            color: Color(0xFF2E7D32), // Dark green
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Transactions',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF424242), // Dark grey
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.refresh,
                          color: Color(0xFF2E7D32), // Dark green
                        ),
                        onPressed: () {
                          context.read<TransactionBloc>()
                              .add(const TransactionEvent.refresh());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _TransactionList(),
                ),
              ],
            ),
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
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
                labelText: 'Type',
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
                          type.name,
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
                  labelText: 'Date',
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
                  DateFormat('yyyy-MM-dd').format(state.date),
                  style: const TextStyle(
                    color: Color(0xFF424242),
                    fontSize: 15,
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
              onPressed: () => context.read<TransactionFormBloc>()
                  .add(const TransactionFormEvent.submitted()),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0xFF2E7D32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TransactionList extends StatefulWidget {
  @override
  State<_TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<_TransactionList> {
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
                  (context, animation) => _buildItem(removedItem, animation),
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
                return _buildItem(_transactions[index], animation);
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

  Widget _buildItem(Transaction transaction, Animation<double> animation) {
    final isIncome = transaction.type == TransactionType.income;

    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).chain(CurveTween(curve: Curves.easeOutCubic)),
          ),
          child: Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isIncome 
                      ? const Color(0xFFE8F5E9)  // Light green
                      : const Color(0xFFFFEBEE), // Light red
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isIncome 
                      ? const Color(0xFF2E7D32)  // Dark green
                      : const Color(0xFFE53935), // Dark red
                ),
              ),
              title: Text(
                transaction.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424242),
                ),
              ),
              subtitle: Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Color(0xFF757575),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('yyyy-MM-dd').format(transaction.date),
                    style: const TextStyle(
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                '\$${transaction.amount}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isIncome 
                      ? const Color(0xFF2E7D32)  // Dark green
                      : const Color(0xFFE53935), // Dark red
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}