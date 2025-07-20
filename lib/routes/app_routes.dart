import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const String home = 'home';
  static const String addExpense = 'add_expense';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    addExpense: (_) => const AddExpenseScreen(),
  };
}
