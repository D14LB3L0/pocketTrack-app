import 'package:dio/dio.dart';
import 'package:pocket_track/api/pocket_track_api.dart';
import 'package:pocket_track/shared/model/model.dart';

class ExpenseTypesService {
  final Dio _dio = DioClient.client;

  Future<List<ExpenseType>> getExpenses() async {
    try {
      final response = await _dio.get('/expenseTypes');

      final data = response.data['data'] as List<dynamic>;

      return data.map((e) => ExpenseType.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Error al obtener gastos: $e');
    }
  }
}
