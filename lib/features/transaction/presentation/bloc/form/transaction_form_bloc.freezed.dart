// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(TransactionType type)? typeChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(TransactionType type)? typeChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_TypeChanged value) typeChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AmountChanged value)? amountChanged,
    TResult? Function(_TypeChanged value)? typeChanged,
    TResult? Function(_DateChanged value)? dateChanged,
    TResult? Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_TypeChanged value)? typeChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFormEventCopyWith<$Res> {
  factory $TransactionFormEventCopyWith(TransactionFormEvent value,
          $Res Function(TransactionFormEvent) then) =
      _$TransactionFormEventCopyWithImpl<$Res, TransactionFormEvent>;
}

/// @nodoc
class _$TransactionFormEventCopyWithImpl<$Res,
        $Val extends TransactionFormEvent>
    implements $TransactionFormEventCopyWith<$Res> {
  _$TransactionFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AmountChangedCopyWith<$Res> {
  factory _$$_AmountChangedCopyWith(
          _$_AmountChanged value, $Res Function(_$_AmountChanged) then) =
      __$$_AmountChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String amount});
}

/// @nodoc
class __$$_AmountChangedCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$_AmountChanged>
    implements _$$_AmountChangedCopyWith<$Res> {
  __$$_AmountChangedCopyWithImpl(
      _$_AmountChanged _value, $Res Function(_$_AmountChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$_AmountChanged(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AmountChanged implements _AmountChanged {
  const _$_AmountChanged(this.amount);

  @override
  final String amount;

  @override
  String toString() {
    return 'TransactionFormEvent.amountChanged(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AmountChanged &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AmountChangedCopyWith<_$_AmountChanged> get copyWith =>
      __$$_AmountChangedCopyWithImpl<_$_AmountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function() submitted,
  }) {
    return amountChanged(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(TransactionType type)? typeChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function()? submitted,
  }) {
    return amountChanged?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(TransactionType type)? typeChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_TypeChanged value) typeChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return amountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AmountChanged value)? amountChanged,
    TResult? Function(_TypeChanged value)? typeChanged,
    TResult? Function(_DateChanged value)? dateChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return amountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_TypeChanged value)? typeChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(this);
    }
    return orElse();
  }
}

abstract class _AmountChanged implements TransactionFormEvent {
  const factory _AmountChanged(final String amount) = _$_AmountChanged;

  String get amount;
  @JsonKey(ignore: true)
  _$$_AmountChangedCopyWith<_$_AmountChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TypeChangedCopyWith<$Res> {
  factory _$$_TypeChangedCopyWith(
          _$_TypeChanged value, $Res Function(_$_TypeChanged) then) =
      __$$_TypeChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionType type});
}

/// @nodoc
class __$$_TypeChangedCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$_TypeChanged>
    implements _$$_TypeChangedCopyWith<$Res> {
  __$$_TypeChangedCopyWithImpl(
      _$_TypeChanged _value, $Res Function(_$_TypeChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_TypeChanged(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
    ));
  }
}

/// @nodoc

class _$_TypeChanged implements _TypeChanged {
  const _$_TypeChanged(this.type);

  @override
  final TransactionType type;

  @override
  String toString() {
    return 'TransactionFormEvent.typeChanged(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TypeChanged &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TypeChangedCopyWith<_$_TypeChanged> get copyWith =>
      __$$_TypeChangedCopyWithImpl<_$_TypeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function() submitted,
  }) {
    return typeChanged(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(TransactionType type)? typeChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function()? submitted,
  }) {
    return typeChanged?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(TransactionType type)? typeChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (typeChanged != null) {
      return typeChanged(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_TypeChanged value) typeChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return typeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AmountChanged value)? amountChanged,
    TResult? Function(_TypeChanged value)? typeChanged,
    TResult? Function(_DateChanged value)? dateChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return typeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_TypeChanged value)? typeChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (typeChanged != null) {
      return typeChanged(this);
    }
    return orElse();
  }
}

abstract class _TypeChanged implements TransactionFormEvent {
  const factory _TypeChanged(final TransactionType type) = _$_TypeChanged;

  TransactionType get type;
  @JsonKey(ignore: true)
  _$$_TypeChangedCopyWith<_$_TypeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DateChangedCopyWith<$Res> {
  factory _$$_DateChangedCopyWith(
          _$_DateChanged value, $Res Function(_$_DateChanged) then) =
      __$$_DateChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$_DateChangedCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$_DateChanged>
    implements _$$_DateChangedCopyWith<$Res> {
  __$$_DateChangedCopyWithImpl(
      _$_DateChanged _value, $Res Function(_$_DateChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$_DateChanged(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DateChanged implements _DateChanged {
  const _$_DateChanged(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'TransactionFormEvent.dateChanged(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DateChanged &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DateChangedCopyWith<_$_DateChanged> get copyWith =>
      __$$_DateChangedCopyWithImpl<_$_DateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function() submitted,
  }) {
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(TransactionType type)? typeChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function()? submitted,
  }) {
    return dateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(TransactionType type)? typeChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_TypeChanged value) typeChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AmountChanged value)? amountChanged,
    TResult? Function(_TypeChanged value)? typeChanged,
    TResult? Function(_DateChanged value)? dateChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_TypeChanged value)? typeChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class _DateChanged implements TransactionFormEvent {
  const factory _DateChanged(final DateTime date) = _$_DateChanged;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$_DateChangedCopyWith<_$_DateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmittedCopyWith<$Res> {
  factory _$$_SubmittedCopyWith(
          _$_Submitted value, $Res Function(_$_Submitted) then) =
      __$$_SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmittedCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$_Submitted>
    implements _$$_SubmittedCopyWith<$Res> {
  __$$_SubmittedCopyWithImpl(
      _$_Submitted _value, $Res Function(_$_Submitted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Submitted implements _Submitted {
  const _$_Submitted();

  @override
  String toString() {
    return 'TransactionFormEvent.submitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Submitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(TransactionType type)? typeChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(TransactionType type)? typeChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_TypeChanged value) typeChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AmountChanged value)? amountChanged,
    TResult? Function(_TypeChanged value)? typeChanged,
    TResult? Function(_DateChanged value)? dateChanged,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_TypeChanged value)? typeChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements TransactionFormEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
mixin _$TransactionFormState {
  String get amount => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionFormStateCopyWith<TransactionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFormStateCopyWith<$Res> {
  factory $TransactionFormStateCopyWith(TransactionFormState value,
          $Res Function(TransactionFormState) then) =
      _$TransactionFormStateCopyWithImpl<$Res, TransactionFormState>;
  @useResult
  $Res call(
      {String amount, TransactionType type, DateTime date, String? error});
}

/// @nodoc
class _$TransactionFormStateCopyWithImpl<$Res,
        $Val extends TransactionFormState>
    implements $TransactionFormStateCopyWith<$Res> {
  _$TransactionFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? type = null,
    Object? date = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionFormStateCopyWith<$Res>
    implements $TransactionFormStateCopyWith<$Res> {
  factory _$$_TransactionFormStateCopyWith(_$_TransactionFormState value,
          $Res Function(_$_TransactionFormState) then) =
      __$$_TransactionFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String amount, TransactionType type, DateTime date, String? error});
}

/// @nodoc
class __$$_TransactionFormStateCopyWithImpl<$Res>
    extends _$TransactionFormStateCopyWithImpl<$Res, _$_TransactionFormState>
    implements _$$_TransactionFormStateCopyWith<$Res> {
  __$$_TransactionFormStateCopyWithImpl(_$_TransactionFormState _value,
      $Res Function(_$_TransactionFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? type = null,
    Object? date = null,
    Object? error = freezed,
  }) {
    return _then(_$_TransactionFormState(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TransactionFormState implements _TransactionFormState {
  const _$_TransactionFormState(
      {required this.amount,
      required this.type,
      required this.date,
      this.error});

  @override
  final String amount;
  @override
  final TransactionType type;
  @override
  final DateTime date;
  @override
  final String? error;

  @override
  String toString() {
    return 'TransactionFormState(amount: $amount, type: $type, date: $date, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionFormState &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, type, date, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionFormStateCopyWith<_$_TransactionFormState> get copyWith =>
      __$$_TransactionFormStateCopyWithImpl<_$_TransactionFormState>(
          this, _$identity);
}

abstract class _TransactionFormState implements TransactionFormState {
  const factory _TransactionFormState(
      {required final String amount,
      required final TransactionType type,
      required final DateTime date,
      final String? error}) = _$_TransactionFormState;

  @override
  String get amount;
  @override
  TransactionType get type;
  @override
  DateTime get date;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionFormStateCopyWith<_$_TransactionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
