import 'package:finme/features/auth/domain/entities/token.dart';

abstract class AuthRepository {
  Future<Token> login({
    required String email,
    required String password
  });

  Future<void> verifyEmail({
    required String email
  });
}