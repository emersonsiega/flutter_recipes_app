// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_operation_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AsyncOperationFailure {
  String get operation;
  String get message;
  ErrorTypes get type;
  Object? get cause;

  /// Create a copy of AsyncOperationFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsyncOperationFailureCopyWith<AsyncOperationFailure> get copyWith =>
      _$AsyncOperationFailureCopyWithImpl<AsyncOperationFailure>(
        this as AsyncOperationFailure,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsyncOperationFailure &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.cause, cause));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    operation,
    message,
    type,
    const DeepCollectionEquality().hash(cause),
  );
}

/// @nodoc
abstract mixin class $AsyncOperationFailureCopyWith<$Res> {
  factory $AsyncOperationFailureCopyWith(
    AsyncOperationFailure value,
    $Res Function(AsyncOperationFailure) _then,
  ) = _$AsyncOperationFailureCopyWithImpl;
  @useResult
  $Res call({String operation, String message, ErrorTypes type, Object? cause});
}

/// @nodoc
class _$AsyncOperationFailureCopyWithImpl<$Res>
    implements $AsyncOperationFailureCopyWith<$Res> {
  _$AsyncOperationFailureCopyWithImpl(this._self, this._then);

  final AsyncOperationFailure _self;
  final $Res Function(AsyncOperationFailure) _then;

  /// Create a copy of AsyncOperationFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? message = null,
    Object? type = null,
    Object? cause = freezed,
  }) {
    return _then(
      _self.copyWith(
        operation: null == operation
            ? _self.operation
            : operation // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ErrorTypes,
        cause: freezed == cause ? _self.cause : cause,
      ),
    );
  }
}

/// @nodoc

class _AsyncOperationFailure extends AsyncOperationFailure {
  _AsyncOperationFailure({
    required this.operation,
    this.message = '',
    required this.type,
    this.cause,
  }) : super._();

  @override
  final String operation;
  @override
  @JsonKey()
  final String message;
  @override
  final ErrorTypes type;
  @override
  final Object? cause;

  /// Create a copy of AsyncOperationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AsyncOperationFailureCopyWith<_AsyncOperationFailure> get copyWith =>
      __$AsyncOperationFailureCopyWithImpl<_AsyncOperationFailure>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AsyncOperationFailure &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.cause, cause));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    operation,
    message,
    type,
    const DeepCollectionEquality().hash(cause),
  );
}

/// @nodoc
abstract mixin class _$AsyncOperationFailureCopyWith<$Res>
    implements $AsyncOperationFailureCopyWith<$Res> {
  factory _$AsyncOperationFailureCopyWith(
    _AsyncOperationFailure value,
    $Res Function(_AsyncOperationFailure) _then,
  ) = __$AsyncOperationFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String operation, String message, ErrorTypes type, Object? cause});
}

/// @nodoc
class __$AsyncOperationFailureCopyWithImpl<$Res>
    implements _$AsyncOperationFailureCopyWith<$Res> {
  __$AsyncOperationFailureCopyWithImpl(this._self, this._then);

  final _AsyncOperationFailure _self;
  final $Res Function(_AsyncOperationFailure) _then;

  /// Create a copy of AsyncOperationFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? operation = null,
    Object? message = null,
    Object? type = null,
    Object? cause = freezed,
  }) {
    return _then(
      _AsyncOperationFailure(
        operation: null == operation
            ? _self.operation
            : operation // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _self.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ErrorTypes,
        cause: freezed == cause ? _self.cause : cause,
      ),
    );
  }
}
