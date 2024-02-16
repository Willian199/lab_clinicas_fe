sealed class AuthException implements Exception {
  final String message;

  AuthException({required this.message});
}

final class AuthErrorException extends AuthException {
  AuthErrorException({required super.message});
}

final class AuthUnauthorizedException extends AuthException {
  AuthUnauthorizedException() : super(message: '');
}
