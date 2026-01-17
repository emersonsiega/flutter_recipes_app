import 'package:flutter_recipes_app/src/domain/failures/error_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'async_operation_failure.freezed.dart';

/// Failure that occurs when an async operation fails
///
/// This is the default async operation failure type across the app.
/// It extends [Failure] and provides context about which operation failed
/// along with an error type for programmatic handling.
@freezed
abstract class AsyncOperationFailure extends Failure with _$AsyncOperationFailure {
  AsyncOperationFailure._();

  factory AsyncOperationFailure({
    required String operation,
    @Default('') String message,
    required ErrorTypes type,
    Object? cause,
  }) = _AsyncOperationFailure;
}
