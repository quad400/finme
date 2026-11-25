import 'package:finme/core/constants/app_secure_keys.dart';
import 'package:finme/core/errors/exception.dart';
import 'package:finme/core/storage/secure_storage.dart';
import 'package:finme/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:finme/features/auth/domain/entities/token.dart';
import 'package:finme/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final SecureStorage securestorage;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.securestorage,
  });

  @override
  Future<Token> login({required String email, required String password}) async {
    final response = await remoteDatasource.login(
      email: email,
      password: password,
    );

    if (!response.success || response.data == null) {
      throw ServerException(response.message);
    }

    final tokenModel = response.data!;
    await securestorage.save(
      AppSecureKeys.kAccessToken,
      tokenModel.accessToken,
    );
    await securestorage.save(
      AppSecureKeys.kRefreshToken,
      tokenModel.refreshToken,
    );
    await securestorage.save(
      AppSecureKeys.kExpiredAt,
      tokenModel.expiresAt.toString(),
    );

    return Token(
      accessToken: tokenModel.accessToken,
      refreshToken: tokenModel.refreshToken,
      expiresAt: tokenModel.expiresAt,
    );
  }

  @override
  Future<void> verifyEmail({required String email}) async {
    final response = await remoteDatasource.verifyEmail(email: email);
    if (!response.success || response.data == null) {
      throw ServerException(response.message);
    }
  }
}
