import 'package:dio/dio.dart';
import 'package:finme/core/errors/exception.dart';

class ErrorHandler {
  static AppException handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.transformTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();

      case DioExceptionType.connectionError:
        return const NetworkException();

      case DioExceptionType.cancel:
        return const CancelledException();

      case DioExceptionType.badCertificate:
        return const NetworkException(
          "Secure connection count not be established",
        );

      case DioExceptionType.unknown:
        return const UnexpectedException();

      case DioExceptionType.badResponse:
        return _handleResponse(error);
    }
  }

  static AppException _handleResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final message = _extractMessage(error.response?.data);

    switch (statusCode) {
      case 400:
        return ServerException(
          message ?? 'Invalid request.',
          statusCode: statusCode,
        );

      case 401:
        return UnauthorizedException(message ?? 'Your session has expired.');

      case 403:
        return ForbiddenException(message ?? 'Access denied.');

      case 404:
        return NotFoundException(message ?? 'Resource not found.');

      case 408:
        return const TimeoutException();

      case 422:
        return ValidationException(message ?? 'Please check your input.');

      case 429:
        return ServerException(
          message ?? 'Too many requests. Please try again later.',
          statusCode: statusCode,
        );

      default:
        if (statusCode != null && statusCode >= 500) {
          return ServerException(
            message ?? 'Server error. Please try again later.',
            statusCode: statusCode,
          );
        }

        return UnexpectedException(message ?? 'An unexpected error occurred.');
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map) {
      final message = data['message'] ?? data['detail'];

      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
    }

    return null;
  }

  static Map<String, dynamic>? _extractErrors(dynamic data) {
    if (data is Map && data['errors'] is Map) {
      return Map<String, dynamic>.from(data['errors']);
    }

    return null;
  }
}
