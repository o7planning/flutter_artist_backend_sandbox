class ApiError {
  final String errorMessage;
  final List<String>? errorDetails;

  ApiError({required this.errorMessage, this.errorDetails});

  Map<String, String> toJson() {
    return {"errorMessage": errorMessage};
  }
}
