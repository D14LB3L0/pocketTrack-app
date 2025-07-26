import 'package:flutter/material.dart';
import 'package:pocket_track/features/expenses/model/model.dart';
import 'package:pocket_track/features/expenses/model/request/update_expense_request.dart';

import '../../../shared/model/expense_type/expense_type.dart';
import '../service/service.dart';

class ExpenseFormProvider extends ChangeNotifier {
  // actions
  final PostExpenseService _postService = PostExpenseService();
  final UpdateExpenseService _updateService = UpdateExpenseService();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // atributes
  late int id;
  late String description = '';
  double? amount;
  ExpenseType? expenseType;
  DateTime? date;

  // loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // validate
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // clean
  void resetForm() {
    description = '';
    amount = 0;
    expenseType = null;
    date = DateTime.now();
    formKey.currentState?.reset();
    notifyListeners();
  }

  // initialize form with data
  bool isInitialized = false;

  void loadFromExpense(Expense expense) {
    id = expense.id;
    description = expense.description;
    amount = expense.amount;
    expenseType = expense.expenseType;
    date = expense.spentAt;
    isInitialized = true;
  }

  // fetchs

  Future<void> fetchPostExpense() async {
    _isLoading = true;
    notifyListeners();

    try {
      final postRequest = PostExpenseRequest(
        description: description,
        amount: amount!,
        expenseTypeId: expenseType?.id ?? 1,
        spentAt: date!,
      );

      await _postService.postExpense(postRequest);
    } catch (e) {
      print('Error: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchUpdateExpense() async {
    _isLoading = true;
    notifyListeners();

    try {
      final updateRequest = UpdateExpenseRequest(
        id: id,
        description: description,
        amount: amount!,
        expenseTypeId: expenseType!.id,
        spentAt: date!,
      );

      await _updateService.updateExpense(updateRequest);
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
