import 'package:finme/core/providers/dio_provider.dart';
import 'package:finme/core/providers/secure_storage_provider.dart';
import 'package:finme/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:finme/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:finme/features/auth/domain/usecases/login_usecase.dart';
import 'package:finme/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authRemoteDataSourceProvider = Provider((ref){
  return AuthRemoteDatasourceImpl(ref.read(dioClientProvider));
});

final authRepositoryProvider = Provider((ref){
  return AuthRepositoryImpl(
    remoteDatasource: ref.read(authRemoteDataSourceProvider),
    securestorage: ref.read(secureStorageProvider),
  );
});

final loginUseCaseProvider = Provider<LoginUsecase>((ref){
  return LoginUsecase(ref.read(authRepositoryProvider));
});

final verifyEmailUseCaseProvider = Provider((ref){
  return VerifyEmailUsecase(ref.read(authRepositoryProvider));
});