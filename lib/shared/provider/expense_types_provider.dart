import 'package:flutter/material.dart';
import 'package:pocket_track/shared/model/model.dart';
import 'package:pocket_track/shared/service/service.dart';

class ExpenseTypesProvider extends ChangeNotifier {
  final ExpenseTypesService _service = ExpenseTypesService();

  List<Datum> _expenseTypes = [];
  bool _isLoading = false;

  List<Datum> get expenseTypes => _expenseTypes;
  bool get isLoading => _isLoading;

  Future<void> fetchExpenseTypes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _expenseTypes = await _service.getExpenses();
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
