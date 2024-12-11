
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';

class ApiService {

  static final ApiService _instance = ApiService._internal();

  late Dio dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://nbu.uz/en/exchange-rates/',
        connectTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await getToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<String?> getToken() async {
    final box = Hive.box('auth');
    final accessToken = box.get('access_token');
    return accessToken;
  }
}