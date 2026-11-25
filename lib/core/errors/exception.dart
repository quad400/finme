abstract class AppException implements Exception{
  final String message;
  final String? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => message;
}

class ServerException extends AppException {
  final int? statusCode;
  final Map<String, dynamic>? data;

  const ServerException(super.message, {this.statusCode, this.data});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Your session has expired, Please login again'])
    : super(code: 'UNAUTHORIZED');
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Resources not found'])
    : super(code: 'NOT_FOUND');
}

class ForbiddenException extends AppException {
  const ForbiddenException([super.message = 'You dont have access'])
    : super(code: 'FORBIDDEN');
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'Please check your internet connection'])
    : super(code: 'NETWORK_ERROR');
}

class TimeoutException extends AppException {
  const TimeoutException([super.message = 'Request timed out, Please try again'])
    : super(code: 'TIMEOUT');
}

class CancelledException extends AppException {
  const CancelledException([super.message = 'Request was cancelled'])
    : super(code: 'TIMEOUT');
}

class UnexpectedException extends AppException {
  const UnexpectedException([super.message = 'Request was cancelled'])
    : super(code: 'TIMEOUT');
}

class ValidationException extends AppException {
  const ValidationException(super.message)
    : super(code: 'UNAUTHORIZED');
}
