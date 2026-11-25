class ApiResponse<T> {
  final bool success;
  final String message;
  final int statusCode;
  final T? data;

  ApiResponse({
    required this.success,
    required this.message,
    required this.statusCode,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic> json)? fromJson
  }) {
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'] == null
          ? null
          : fromJson?.call(json['data'] as Map<String, dynamic>),
    );
  }
}
