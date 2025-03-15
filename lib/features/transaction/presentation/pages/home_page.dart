import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/transaction_bloc.dart';
import '../group_by_type.dart';
import '../widgets/transaction_form.dart';
import '../widgets/transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool _isFormExpanded = false;
  bool _areAllGroupsExpanded = true;
  GroupByType _groupByType = GroupByType.type;
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
                            child: TransactionForm(),
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
                          child: DropdownButtonFormField<GroupByType>(
                            value: _groupByType,
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
                                value: GroupByType.type,
                                child: Text('Type'),
                              ),
                              DropdownMenuItem(
                                value: GroupByType.day,
                                child: Text('Day'),
                              ),
                              DropdownMenuItem(
                                value: GroupByType.month,
                                child: Text('Month'),
                              ),
                              DropdownMenuItem(
                                value: GroupByType.year,
                                child: Text('Year'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _groupByType = value;
                                });
                              }
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
                        icon: Icon(
                          _areAllGroupsExpanded
                              ? Icons.unfold_less_rounded
                              : Icons.unfold_more_rounded,
                          color: const Color(0xFF2E7D32),
                        ),
                        tooltip: _areAllGroupsExpanded
                            ? 'Collapse all groups'
                            : 'Expand all groups',
                        onPressed: () {
                          setState(() {
                            _areAllGroupsExpanded = !_areAllGroupsExpanded;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TransactionList(
                    groupByType: _groupByType,
                    areAllGroupsExpanded: _areAllGroupsExpanded,
                    onToggleAllGroups: (value) {
                      setState(() {
                        _areAllGroupsExpanded = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}