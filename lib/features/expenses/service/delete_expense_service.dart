import 'package:dio/dio.dart';
import 'package:pocket_track/api/pocket_track_api.dart';

class DeleteExpenseService {
  final Dio _dio = DioClient.client;

  Future deleteExpense(int id) async {
    try {
      await _dio.delete('/expenses/$id');
    } catch (e) {
      throw Exception('Error al hacer el delete: $e');
    }
  }
}
