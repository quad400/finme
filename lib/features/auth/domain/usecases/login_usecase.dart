import 'package:finme/features/auth/domain/entities/token.dart';
import 'package:finme/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Token> call({
    required String email,
    required String password,
  }) async {
    return await repository.login(email: email, password: password);
  }
}