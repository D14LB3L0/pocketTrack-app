import 'package:flutter/material.dart';
import 'package:pocket_track/features/expenses/model/expense.dart';
import 'package:pocket_track/features/expenses/service/delete_expense_service.dart';
import 'package:pocket_track/features/expenses/service/service.dart';
import 'package:pocket_track/shared/service/expense/get_total_expense_service.dart';

class ExpenseProvider extends ChangeNotifier {
  final DeleteExpenseService _deleteService = DeleteExpenseService();
  final GetAllExpensesService _service = GetAllExpensesService();

  final GetTotalExpenseService _totalService = GetTotalExpenseService();

  List<Expense> _expenses = [];
  double _totalExpense = 0;

  bool _isLoading = false;
  bool _isTotalLoading = false;
  int? _deletingExpenseId;

  List<Expense> get expenses => _expenses;
  double get totalExpense => _totalExpense;

  bool get isLoading => _isLoading;
  bool get isTotalLoading => _isTotalLoading;
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

  Future<void> fetchTotalExpense() async {
    _isTotalLoading = true;
    notifyListeners();

    try {
      _totalExpense = await _totalService.getTotalExpense();
    } catch (e) {
      print('Error: $e');
    } finally {
      _isTotalLoading = false;
      notifyListeners();
    }
  }
}
