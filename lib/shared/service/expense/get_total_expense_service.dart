import 'package:dio/dio.dart';
import 'package:pocket_track/api/pocket_track_api.dart';
import 'package:pocket_track/shared/model/expense/response/response.dart';

class GetTotalExpenseService {
  final Dio _dio = DioClient.client;

  Future<double> getTotalExpense() async {
    try {
      final response = await _dio.get('/expenses/total');
      final parsedResponse = GetTotalExpenseResponse.fromMap(response.data);

      return parsedResponse.data;
    } catch (e) {
      throw Exception('Error al obtener el total de los gastos: $e');
    }
  }
}
