import 'package:flutter/material.dart';
import 'package:pocket_track/features/expenses/model/expense.dart';
import 'package:pocket_track/features/expenses/service/service.dart';

class ExpenseProvider extends ChangeNotifier {
  final GetAllExpensesService _service = GetAllExpensesService();

  List<Expense> _expenses = [];
  bool _isLoading = false;

  List<Expense> get expenses => _expenses;
  bool get isLoading => _isLoading;

  Future<void> fetchGetAllExpenses() async {
    _isLoading = true;
    notifyListeners();

    try {
      _expenses = await _service.getAllExpenses();
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
