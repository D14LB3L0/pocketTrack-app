import 'package:flutter/material.dart';
import 'package:pocket_track/shared/model/expense_type/expense_type.dart';
import 'package:pocket_track/shared/service/service.dart';

class ExpenseTypesProvider extends ChangeNotifier {
  final GetAllExpenseTypesService _service = GetAllExpenseTypesService();

  List<ExpenseType> _expenseTypes = [];
  bool _isLoading = false;

  List<ExpenseType> get expenseTypes => _expenseTypes;
  bool get isLoading => _isLoading;

  Future<void> fetchGetAllExpenseTypes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _expenseTypes = await _service.getAllExpenseTypes();
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
