class ApiException implements Exception {
  final int statusCode;
  final int? prologErrorCode;
  final String message;
  final String? detailedMessage;

  ApiException({
    required this.statusCode,
    required this.message,
    this.prologErrorCode,
    this.detailedMessage,
  });

  @override
  String toString() {
    return 'ApiException: $message (${detailedMessage ?? ''})';
  }
}
