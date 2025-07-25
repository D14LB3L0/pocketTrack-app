import 'package:flutter/material.dart';
import 'package:pocket_track/features/expenses/model/model.dart';

import '../../../shared/model/expense_type/expense_type.dart';
import '../service/service.dart';

class ExpenseFormProvider extends ChangeNotifier {
  final PostExpenseService _postService = PostExpenseService();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // atributes
  late String description;
  late double amount;
  ExpenseType? expenseType;
  late DateTime date;

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

  Future<void> fetchPostExpense() async {
    _isLoading = true;
    notifyListeners();

    try {
      final postRequest = PostExpenseRequest(
        description: description,
        amount: amount,
        expenseTypeId: expenseType?.id ?? 1,
        spentAt: date,
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
}
