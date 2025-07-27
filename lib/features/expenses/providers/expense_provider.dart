import 'package:flutter/material.dart';
import 'package:pocket_track/features/expenses/model/expense.dart';
import 'package:pocket_track/features/expenses/service/delete_expense_service.dart';
import 'package:pocket_track/features/expenses/service/service.dart';

class ExpenseProvider extends ChangeNotifier {
  final DeleteExpenseService _deleteService = DeleteExpenseService();
  final GetAllExpensesService _service = GetAllExpensesService();

  List<Expense> _expenses = [];
  bool _isLoading = false;
  int? _deletingExpenseId;

  List<Expense> get expenses => _expenses;
  bool get isLoading => _isLoading;
  int? get deletingExpenseId => _deletingExpenseId;

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

  Future<void> deleteExpense(int id) async {
    _deletingExpenseId = id;
    notifyListeners();

    try {
      await _deleteService.deleteExpense(id);
    } catch (e) {
      print('Error: $e');
    } finally {
      _deletingExpenseId = null;
      notifyListeners();
    }
  }
}
