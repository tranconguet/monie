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
    required TResult Function(String description) noteChanged,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(TransactionType type)? typeChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(String description)? noteChanged,
    TResult? Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(TransactionType type)? typeChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String description)? noteChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(TypeChanged value) typeChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(NoteChanged value) noteChanged,
    required TResult Function(Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(TypeChanged value)? typeChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(NoteChanged value)? noteChanged,
    TResult? Function(Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(TypeChanged value)? typeChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(NoteChanged value)? noteChanged,
    TResult Function(Submitted value)? submitted,
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
abstract class _$$AmountChangedCopyWith<$Res> {
  factory _$$AmountChangedCopyWith(
          _$AmountChanged value, $Res Function(_$AmountChanged) then) =
      __$$AmountChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String amount});
}

/// @nodoc
class __$$AmountChangedCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$AmountChanged>
    implements _$$AmountChangedCopyWith<$Res> {
  __$$AmountChangedCopyWithImpl(
      _$AmountChanged _value, $Res Function(_$AmountChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$AmountChanged(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AmountChanged implements AmountChanged {
  const _$AmountChanged(this.amount);

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
            other is _$AmountChanged &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountChangedCopyWith<_$AmountChanged> get copyWith =>
      __$$AmountChangedCopyWithImpl<_$AmountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String description) noteChanged,
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
    TResult? Function(String description)? noteChanged,
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
    TResult Function(String description)? noteChanged,
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
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(TypeChanged value) typeChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(NoteChanged value) noteChanged,
    required TResult Function(Submitted value) submitted,
  }) {
    return amountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(TypeChanged value)? typeChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(NoteChanged value)? noteChanged,
    TResult? Function(Submitted value)? submitted,
  }) {
    return amountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(TypeChanged value)? typeChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(NoteChanged value)? noteChanged,
    TResult Function(Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(this);
    }
    return orElse();
  }
}

abstract class AmountChanged implements TransactionFormEvent {
  const factory AmountChanged(final String amount) = _$AmountChanged;

  String get amount;
  @JsonKey(ignore: true)
  _$$AmountChangedCopyWith<_$AmountChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TypeChangedCopyWith<$Res> {
  factory _$$TypeChangedCopyWith(
          _$TypeChanged value, $Res Function(_$TypeChanged) then) =
      __$$TypeChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionType type});
}

/// @nodoc
class __$$TypeChangedCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$TypeChanged>
    implements _$$TypeChangedCopyWith<$Res> {
  __$$TypeChangedCopyWithImpl(
      _$TypeChanged _value, $Res Function(_$TypeChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$TypeChanged(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
    ));
  }
}

/// @nodoc

class _$TypeChanged implements TypeChanged {
  const _$TypeChanged(this.type);

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
            other is _$TypeChanged &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeChangedCopyWith<_$TypeChanged> get copyWith =>
      __$$TypeChangedCopyWithImpl<_$TypeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String description) noteChanged,
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
    TResult? Function(String description)? noteChanged,
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
    TResult Function(String description)? noteChanged,
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
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(TypeChanged value) typeChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(NoteChanged value) noteChanged,
    required TResult Function(Submitted value) submitted,
  }) {
    return typeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(TypeChanged value)? typeChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(NoteChanged value)? noteChanged,
    TResult? Function(Submitted value)? submitted,
  }) {
    return typeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(TypeChanged value)? typeChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(NoteChanged value)? noteChanged,
    TResult Function(Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (typeChanged != null) {
      return typeChanged(this);
    }
    return orElse();
  }
}

abstract class TypeChanged implements TransactionFormEvent {
  const factory TypeChanged(final TransactionType type) = _$TypeChanged;

  TransactionType get type;
  @JsonKey(ignore: true)
  _$$TypeChangedCopyWith<_$TypeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DateChangedCopyWith<$Res> {
  factory _$$DateChangedCopyWith(
          _$DateChanged value, $Res Function(_$DateChanged) then) =
      __$$DateChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$DateChangedCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$DateChanged>
    implements _$$DateChangedCopyWith<$Res> {
  __$$DateChangedCopyWithImpl(
      _$DateChanged _value, $Res Function(_$DateChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$DateChanged(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DateChanged implements DateChanged {
  const _$DateChanged(this.date);

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
            other is _$DateChanged &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateChangedCopyWith<_$DateChanged> get copyWith =>
      __$$DateChangedCopyWithImpl<_$DateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String description) noteChanged,
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
    TResult? Function(String description)? noteChanged,
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
    TResult Function(String description)? noteChanged,
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
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(TypeChanged value) typeChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(NoteChanged value) noteChanged,
    required TResult Function(Submitted value) submitted,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(TypeChanged value)? typeChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(NoteChanged value)? noteChanged,
    TResult? Function(Submitted value)? submitted,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(TypeChanged value)? typeChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(NoteChanged value)? noteChanged,
    TResult Function(Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class DateChanged implements TransactionFormEvent {
  const factory DateChanged(final DateTime date) = _$DateChanged;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$DateChangedCopyWith<_$DateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoteChangedCopyWith<$Res> {
  factory _$$NoteChangedCopyWith(
          _$NoteChanged value, $Res Function(_$NoteChanged) then) =
      __$$NoteChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$NoteChangedCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$NoteChanged>
    implements _$$NoteChangedCopyWith<$Res> {
  __$$NoteChangedCopyWithImpl(
      _$NoteChanged _value, $Res Function(_$NoteChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$NoteChanged(
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoteChanged implements NoteChanged {
  const _$NoteChanged(this.description);

  @override
  final String description;

  @override
  String toString() {
    return 'TransactionFormEvent.noteChanged(description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteChanged &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteChangedCopyWith<_$NoteChanged> get copyWith =>
      __$$NoteChangedCopyWithImpl<_$NoteChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String description) noteChanged,
    required TResult Function() submitted,
  }) {
    return noteChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String amount)? amountChanged,
    TResult? Function(TransactionType type)? typeChanged,
    TResult? Function(DateTime date)? dateChanged,
    TResult? Function(String description)? noteChanged,
    TResult? Function()? submitted,
  }) {
    return noteChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String amount)? amountChanged,
    TResult Function(TransactionType type)? typeChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String description)? noteChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (noteChanged != null) {
      return noteChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(TypeChanged value) typeChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(NoteChanged value) noteChanged,
    required TResult Function(Submitted value) submitted,
  }) {
    return noteChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(TypeChanged value)? typeChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(NoteChanged value)? noteChanged,
    TResult? Function(Submitted value)? submitted,
  }) {
    return noteChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(TypeChanged value)? typeChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(NoteChanged value)? noteChanged,
    TResult Function(Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (noteChanged != null) {
      return noteChanged(this);
    }
    return orElse();
  }
}

abstract class NoteChanged implements TransactionFormEvent {
  const factory NoteChanged(final String description) = _$NoteChanged;

  String get description;
  @JsonKey(ignore: true)
  _$$NoteChangedCopyWith<_$NoteChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmittedCopyWith<$Res> {
  factory _$$SubmittedCopyWith(
          _$Submitted value, $Res Function(_$Submitted) then) =
      __$$SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmittedCopyWithImpl<$Res>
    extends _$TransactionFormEventCopyWithImpl<$Res, _$Submitted>
    implements _$$SubmittedCopyWith<$Res> {
  __$$SubmittedCopyWithImpl(
      _$Submitted _value, $Res Function(_$Submitted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Submitted implements Submitted {
  const _$Submitted();

  @override
  String toString() {
    return 'TransactionFormEvent.submitted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Submitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String amount) amountChanged,
    required TResult Function(TransactionType type) typeChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String description) noteChanged,
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
    TResult? Function(String description)? noteChanged,
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
    TResult Function(String description)? noteChanged,
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
    required TResult Function(AmountChanged value) amountChanged,
    required TResult Function(TypeChanged value) typeChanged,
    required TResult Function(DateChanged value) dateChanged,
    required TResult Function(NoteChanged value) noteChanged,
    required TResult Function(Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AmountChanged value)? amountChanged,
    TResult? Function(TypeChanged value)? typeChanged,
    TResult? Function(DateChanged value)? dateChanged,
    TResult? Function(NoteChanged value)? noteChanged,
    TResult? Function(Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AmountChanged value)? amountChanged,
    TResult Function(TypeChanged value)? typeChanged,
    TResult Function(DateChanged value)? dateChanged,
    TResult Function(NoteChanged value)? noteChanged,
    TResult Function(Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class Submitted implements TransactionFormEvent {
  const factory Submitted() = _$Submitted;
}

/// @nodoc
mixin _$TransactionFormState {
  String get amount => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;

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
      {String amount,
      TransactionType type,
      DateTime date,
      String? description,
      String? error,
      bool? isSuccess});
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
    Object? description = freezed,
    Object? error = freezed,
    Object? isSuccess = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {String amount,
      TransactionType type,
      DateTime date,
      String? description,
      String? error,
      bool? isSuccess});
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
    Object? description = freezed,
    Object? error = freezed,
    Object? isSuccess = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_TransactionFormState implements _TransactionFormState {
  const _$_TransactionFormState(
      {required this.amount,
      required this.type,
      required this.date,
      this.description,
      this.error,
      this.isSuccess});

  @override
  final String amount;
  @override
  final TransactionType type;
  @override
  final DateTime date;
  @override
  final String? description;
  @override
  final String? error;
  @override
  final bool? isSuccess;

  @override
  String toString() {
    return 'TransactionFormState(amount: $amount, type: $type, date: $date, description: $description, error: $error, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionFormState &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, amount, type, date, description, error, isSuccess);

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
      final String? description,
      final String? error,
      final bool? isSuccess}) = _$_TransactionFormState;

  @override
  String get amount;
  @override
  TransactionType get type;
  @override
  DateTime get date;
  @override
  String? get description;
  @override
  String? get error;
  @override
  bool? get isSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionFormStateCopyWith<_$_TransactionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
