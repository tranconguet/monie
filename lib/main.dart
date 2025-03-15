import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'config/injection.dart';
import 'features/transaction/data/models/transaction_model.dart';
import 'features/transaction/domain/entities/transaction_type.dart';
import 'features/transaction/domain/repositories/transaction_repository.dart';
import 'features/transaction/presentation/bloc/transaction_bloc.dart';
import 'features/transaction/presentation/bloc/form/transaction_form_bloc.dart';
import 'features/transaction/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  print('Initializing Hive...');
  // Initialize Hive
  await Hive.initFlutter();
  
  print('Registering Hive adapters...');
  // Register Hive Adapters
  Hive.registerAdapter(TransactionModelAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());
  
  print('Opening Hive box...');
  // Open Hive Box
  final box = await Hive.openBox<TransactionModel>('transactions');
  print('Hive box opened with ${box.length} items');
  
  // Add shutdown hook
  WidgetsBinding.instance.addObserver(
    LifecycleEventHandler(
      detachedCallBack: () async {
        print('App detached, closing Hive box...');
        await box.compact();
        await box.close();
      },
    ),
  );
  
  print('Initializing dependencies...');
  // Initialize dependencies
  await configureDependencies();
  print('Dependencies initialized');
  
  runApp(const MoneyManagerApp());
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final Future<void> Function() detachedCallBack;

  LifecycleEventHandler({
    required this.detachedCallBack,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.detached) {
      await detachedCallBack();
    }
  }
}

class MoneyManagerApp extends StatelessWidget {
  const MoneyManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TransactionBloc>()
            ..add(const TransactionEvent.started()),
        ),
        BlocProvider(
          create: (context) => getIt<TransactionFormBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Money Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
