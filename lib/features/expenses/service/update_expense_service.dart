import 'package:dio/dio.dart';
import 'package:pocket_track/api/pocket_track_api.dart';
import 'package:pocket_track/features/expenses/model/request/update_expense_request.dart';

class UpdateExpenseService {
  final Dio _dio = DioClient.client;

  Future updateExpense(UpdateExpenseRequest updateExpense) async {
    try {
      await _dio.put('/expenses', data: updateExpense.toJson());
    } catch (e) {
      throw Exception('Error al hacer el put: $e');
    }
  }
}
