class ApiException  implements Exception {
  const ApiException({required this.message, required this.statusCode});

  final String message;
  final dynamic statusCode;

}
