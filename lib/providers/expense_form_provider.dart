import 'package:flutter/material.dart';

import '../types/types.dart';

class ExpenseFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // atributes
  String description = '';
  late double amount;
  ExpenseType? expenseType;
  late DateTime date;

  // loading
  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  // validate
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
