import 'package:dio/dio.dart';
import 'package:pocket_track/api/pocket_track_api.dart';

import '../model/model.dart';

class PostExpenseService {
  final Dio _dio = DioClient.client;

  Future postExpense(PostExpenseRequest postExpense) async {
    try {
      await _dio.post('/expenses', data: postExpense.toJson());
    } catch (e) {
      throw Exception('Error al hacer el post: $e');
    }
  }
}
