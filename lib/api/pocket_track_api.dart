import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  static Dio get client {
    final baseUrl = dotenv.env['API_POCKETTRACK'] ?? '';

    return Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(seconds: 40),
      headers: {
        'Content-Type': 'application/json',
      },
    ))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // Agregar token si es que se necesita 
          return handler.next(options);
        },
      ));
  }
}
