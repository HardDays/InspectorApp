class ApiException implements Exception {
  final String message;
  final String details;

  ApiException(this.message, {this.details});
}