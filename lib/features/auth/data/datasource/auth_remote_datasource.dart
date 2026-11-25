import 'package:dio/dio.dart';
import 'package:finme/core/constants/app_server_routes.dart';
import 'package:finme/core/errors/error_handler.dart';
import 'package:finme/core/network/api_response.dart';
import 'package:finme/features/auth/data/model/token_model.dart';

abstract class AuthRemoteDatasource {
  Future<ApiResponse<TokenModel>> login({
    required String email,
    required String password,
  });

  Future<ApiResponse> verifyEmail({required String email});
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<ApiResponse<TokenModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        AppServerRoutes.login,
        data: {'email': email, 'password': password},
      );

      return ApiResponse<TokenModel>.fromJson(
        response.data,
        fromJson: TokenModel.fromJson,
      );
    } on DioException catch (error) {
      throw ErrorHandler.handle(error);
    }
  }

  @override
  Future<ApiResponse> verifyEmail({required String email}) async {
    try {
      final response = await dio.post(AppServerRoutes.verifyEmail, data: {'email': email});
    
      return ApiResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw ErrorHandler.handle(error);
    }
  }
}
