import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'config/injection.dart';
import 'features/transaction/data/models/transaction_model.dart';
import 'features/transaction/domain/entities/transaction_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register Hive Adapters
  Hive.registerAdapter(TransactionModelAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());
  
  // Open Hive Box
  await Hive.openBox<TransactionModel>('transactions');
  
  // Initialize dependencies
  await configureDependencies();
  
  runApp(const MoneyManagerApp());
}

class MoneyManagerApp extends StatelessWidget {
  const MoneyManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Money Manager App'),
        ),
      ),
    );
  }
}
