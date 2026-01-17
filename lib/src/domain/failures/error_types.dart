/// Enum representing different types of errors
enum ErrorTypes {
  /// A timeout occurred while performing the operation
  timeout,

  /// The requested resource was not found
  notFound,

  /// The request was invalid or malformed - error on the client side
  invalidRequest,

  /// Remote returned an error - error on the server side
  server,

  /// Unexpected/unknown error
  unknown,
}
