// Singleton, Http-Client Provider
import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  ApiClient._internal();

  factory ApiClient() => _instance;

  Dio dio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: '',
      ),
    );
    return dio;
  }
}
