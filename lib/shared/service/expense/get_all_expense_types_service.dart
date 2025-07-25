import 'package:dio/dio.dart';
import 'package:pocket_track/api/pocket_track_api.dart';

import '../../model/expense_type/expense_type.dart';
import '../../model/model.dart';

class GetAllExpenseTypesService {
  final Dio _dio = DioClient.client;

  Future<List<ExpenseType>> getAllExpenseTypes() async {
    try {
      final response = await _dio.get('/expenseTypes');

      final parsedResponse = GetAllExpenseTypeResponse.fromMap(response.data);

      return parsedResponse.data;
    } catch (e) {
      throw Exception('Error al obtener gastos: $e');
    }
  }
}
