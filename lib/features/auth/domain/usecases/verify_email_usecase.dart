import 'package:finme/features/auth/domain/repositories/auth_repository.dart';

class VerifyEmailUsecase {
  final AuthRepository repository;

  VerifyEmailUsecase(this.repository);

  Future<void> call({
    required String email
  }){
   return repository.verifyEmail(email: email);
  }
}