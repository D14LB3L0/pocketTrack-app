import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// own
import '../widgets/widgets.dart';
import '../providers/providers.dart';
import '../../../shared/widgets/widgets.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expense')),
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: CardContainer(
            child: Column(
              children: [
                ChangeNotifierProvider(
                  create: (_) => ExpenseFormProvider(),
                  child: ExpenseForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
