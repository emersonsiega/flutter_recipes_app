/// Base class for all domain-level failures
///
/// Domain failures represent business-level errors that can occur
/// during domain operations, abstracting away the underlying implementation
/// details (network, storage, etc.)
class Failure implements Exception {
  /// Human-readable error message
  final String message;

  /// Optional underlying exception that caused this failure
  final Object? cause;

  Failure({required this.message, this.cause});

  @override
  String toString() => message;
}
