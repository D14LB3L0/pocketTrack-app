import 'package:flutter/material.dart';
import 'package:pocket_track/providers/expense_form_provider.dart';
import 'package:pocket_track/theme/app_theme.dart';
import 'package:pocket_track/ui/ui.dart';
import 'package:pocket_track/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../types/types.dart';

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
                  child: _ExpenseForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExpenseForm extends StatelessWidget {
  const _ExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseForm = Provider.of<ExpenseFormProvider>(context);

    final width = MediaQuery.of(context).size.width;

    return Form(
      key: expenseForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Description', style: TextStyle(fontSize: 18)),

                TextFormField(
                  autocorrect: false,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecorations.formInputDecoration(
                    hintText: 'Add a short description.',
                  ),
                  onChanged: (value) => expenseForm.description = value,
                ),

                SizedBox(height: 25),

                Text('Amount', style: TextStyle(fontSize: 18)),

                TextFormField(
                  autocorrect: false,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecorations.formInputDecoration(
                    hintText: 'Enter amount.',
                  ),
                  onChanged: (value) => expenseForm.description = value,
                ),

                SizedBox(height: 25),

                Text('Expense Type', style: TextStyle(fontSize: 18)),

                DropdownMenu<ExpenseType>(
                  initialSelection: expenseForm.expenseType,
                  onSelected: (ExpenseType? type) {
                    if (type != null) expenseForm.expenseType = type;
                  },
                  dropdownMenuEntries: ExpenseType.values.map((type) {
                    return DropdownMenuEntry(value: type, label: type.name);
                  }).toList(),
                  hintText: 'Select a type',
                  width: width * 0.9,
                  menuStyle: MenuStyle(
                    maximumSize: WidgetStateProperty.all(
                      Size(width * 0.84, double.infinity),
                    ),
                  ),
                ),

                SizedBox(height: 40),

                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: width * 0.7,
                    child: MaterialButton(
                      onPressed: () {},
                      color: AppTheme.secondaryColor,
                      child: Text(
                        'Register Expense',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
