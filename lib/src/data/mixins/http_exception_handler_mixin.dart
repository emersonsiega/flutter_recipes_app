import 'dart:async';

import 'package:dart_either/dart_either.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/infra/logger/logger.dart';

/// Mixin that provides default parsing/transformation of HTTP client exceptions
/// to [Failure]
///
/// This mixin can be used by repositories to avoid duplicating try-catch blocks
/// on every method that makes HTTP calls.
mixin HttpExceptionHandlerMixin {
  /// Executes an async operation and handles HTTP exceptions, converting them
  /// to [Failure]
  ///
  /// [operation] - The name of the operation being performed (e.g., 'loadItems', 'deleteItem')
  /// [action] - The async function to execute
  Future<Either<Failure, T>> handleHttpExceptions<T>({
    required String operation,
    required Future<T> Function() action,
  }) async {
    try {
      final result = await action();
      return Right(result);
    } on TimeoutException catch (e) {
      return Left(Failure(message: 'Timeout occurred while performing $operation', cause: e));
    } on FormatException catch (e) {
      return Left(Failure(message: 'Invalid format while performing $operation', cause: e));
    } catch (e, s) {
      logger.e('Unexpected error during $operation', error: e, stackTrace: s);
      return Left(Failure(message: 'Unexpected error during $operation', cause: e));
    }
  }
}
