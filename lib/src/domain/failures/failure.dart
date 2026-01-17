/// Base class for all domain-level failures
///
/// Domain failures represent business-level errors that can occur
/// during domain operations, abstracting away the underlying implementation
/// details (network, storage, etc.)
abstract class Failure implements Exception {
  /// Human-readable error message
  String get message;

  /// Optional underlying exception that caused this failure
  Object? cause;

  @override
  String toString() => message;
}
