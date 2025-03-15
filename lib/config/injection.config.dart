// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/api_client.dart' as _i3;
import '../features/transaction/data/datasources/transaction_local_datasource.dart'
    as _i4;
import '../features/transaction/data/repositories/transaction_repository_impl.dart'
    as _i6;
import '../features/transaction/domain/repositories/transaction_repository.dart'
    as _i5;
import '../features/transaction/domain/usecases/delete_transaction.dart' as _i7;
import '../features/transaction/domain/usecases/get_transactions.dart' as _i8;
import '../features/transaction/presentation/bloc/form/transaction_form_bloc.dart'
    as _i10;
import '../features/transaction/presentation/bloc/transaction_bloc.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApiClient>(() => _i3.ApiClient());
    gh.lazySingleton<_i4.TransactionLocalDataSource>(
        () => _i4.TransactionLocalDataSourceImpl());
    gh.factory<_i5.TransactionRepository>(() =>
        _i6.TransactionRepositoryImpl(get<_i4.TransactionLocalDataSource>()));
    gh.factory<_i7.DeleteTransaction>(
        () => _i7.DeleteTransaction(get<_i5.TransactionRepository>()));
    gh.factory<_i8.GetTransactions>(
        () => _i8.GetTransactions(get<_i5.TransactionRepository>()));
    gh.singleton<_i9.TransactionBloc>(_i9.TransactionBloc(
      get<_i8.GetTransactions>(),
      get<_i7.DeleteTransaction>(),
    ));
    gh.singleton<_i10.TransactionFormBloc>(_i10.TransactionFormBloc(
      get<_i5.TransactionRepository>(),
      get<_i9.TransactionBloc>(),
    ));
    return this;
  }
}
