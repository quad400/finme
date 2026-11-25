import 'package:dio/dio.dart';

class DioClient {


  static Dio create() {
    final dio = _baseDio();

    dio.interceptors.addAll([
      // AuthInterceptor()
    ]);

    return dio;
  }



  static Dio _baseDio() {
    return Dio(
      BaseOptions(
        baseUrl: "https://middleware.pillarsalt.com",
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );
  }
}
