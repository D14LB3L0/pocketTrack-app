import 'package:flutter/material.dart';

import '../features/expenses/screens/screens.dart';


class AppRoutes {
  static const String expense = 'expense';
  static const String addExpense = 'add_expense';

  static final Map<String, WidgetBuilder> routes = {
    expense: (_) => const ExpenseScreen(),
    addExpense: (_) => const AddExpenseScreen(),
  };
}
