import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movie_api/constants/app_constants.dart';

class DioClient {
  static late Dio _dio;

  static FutureOr<Dio> setUp() {
    final baseOption = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    _dio = Dio(baseOption);
    return _dio;
  }

  static Dio get dio => _dio;
}