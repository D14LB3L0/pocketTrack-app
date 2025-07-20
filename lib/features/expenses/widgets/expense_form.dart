import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// own
import '../types/types.dart';
import '../providers/providers.dart';
import '../../../shared/theme/theme.dart';
import '../../../shared/widgets/widgets.dart';

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final expenseForm = Provider.of<ExpenseFormProvider>(context);

    return Form(
      key: expenseForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: _ExpenseFormFields(expenseForm: expenseForm, width: width),
          ),
        ],
      ),
    );
  }
}

class _ExpenseFormFields extends StatelessWidget {
  const _ExpenseFormFields({required this.expenseForm, required this.width});

  final ExpenseFormProvider expenseForm;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DescriptionInput(expenseForm: expenseForm),

        _AmountInput(expenseForm: expenseForm),

        _DropDownType(expenseForm: expenseForm, width: width),

        _DatePickerInput(),

        _SubmitButton(width: width),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width * 0.7,
        child: MaterialButton(
          onPressed: () {},
          color: AppTheme.secondaryColor,
          child: Text(
            'Register Expense',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class _DatePickerInput extends StatelessWidget {
  const _DatePickerInput();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date', style: TextStyle(fontSize: 18)),
        SizedBox(height: 10),
        DatePickerInput(),
        SizedBox(height: 40),
      ],
    );
  }
}

class _DropDownType extends StatelessWidget {
  const _DropDownType({
    required this.expenseForm,
    required this.width,
  });

  final ExpenseFormProvider expenseForm;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          trailingIcon: Icon(
            Icons.arrow_drop_down,
            color: AppTheme.primaryColor, // Cambia aquí el color que desees
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}

class _AmountInput extends StatelessWidget {
  const _AmountInput({required this.expenseForm});

  final ExpenseFormProvider expenseForm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  const _DescriptionInput({required this.expenseForm});

  final ExpenseFormProvider expenseForm;

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
