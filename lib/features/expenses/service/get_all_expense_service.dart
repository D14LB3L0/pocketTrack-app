import 'package:dio/dio.dart';
import 'package:pocket_track/api/pocket_track_api.dart';
import 'package:pocket_track/features/expenses/model/model.dart';

class GetAllExpensesService {
  final Dio _dio = DioClient.client;

  Future<List<Expense>> getAllExpenses() async{
    try {
      final response = await _dio.get('/expenses');
      final parsedResponse = GetAllExpenseResponse.fromMap(response.data);

      return parsedResponse.data;

    } catch (e) {
      throw Exception('Error al obtener gastos: $e');
    }
  }
}
