import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/injection.dart';
import 'core/l10n/app_localizations.dart';
import 'core/providers/language_provider.dart';
import 'core/theme/app_theme.dart';
import 'features/transaction/data/models/transaction_model.dart';
import 'features/transaction/domain/entities/transaction_type.dart';
import 'features/transaction/presentation/bloc/form/transaction_form_bloc.dart';
import 'features/transaction/presentation/bloc/transaction_bloc.dart';
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
  
  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  
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
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(prefs),
      child: const MoneyManagerApp(),
    ),
  );
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
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            title: 'Money Manager',
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            locale: languageProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('vi'),
            ],
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
