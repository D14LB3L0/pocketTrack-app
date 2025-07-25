import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_track/routes/app_routes.dart';
import 'package:pocket_track/shared/provider/provider.dart';
import 'package:pocket_track/shared/utils/utils.dart';
import 'package:provider/provider.dart';

// own
import '../../../shared/model/expense_type/expense_type.dart';
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
      autovalidateMode: AutovalidateMode.disabled,
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

        _AmountInput(onChanged: (value) => expenseForm.amount = value),

        _DropDownType(expenseForm: expenseForm, width: width),

        _DatePickerInput(expenseForm: expenseForm),

        _SubmitButton(expenseForm: expenseForm, width: width),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({required this.width, required this.expenseForm});

  final double width;
  final ExpenseFormProvider expenseForm;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width * 0.7,
        child: MaterialButton(
          onPressed: expenseForm.isLoading
              ? null
              : () async {
                  final isValid = expenseForm.isValidForm();
                  if (!isValid) return;

                  try {
                    await expenseForm.fetchPostExpense();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppMessages.dataSaved)),
                    );

                    expenseForm.resetForm();

                    Navigator.pushReplacementNamed(context, AppRoutes.expense);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(AppMessages.genericError)),
                    );
                  }
                },
          color: AppTheme.secondaryColor,
          disabledColor: AppTheme.disabled,
          child: expenseForm.isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Register Expense',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              : Text(
                  'Register Expense',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}

class _DatePickerInput extends StatelessWidget {
  final ExpenseFormProvider expenseForm;

  const _DatePickerInput({required this.expenseForm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputTexts.requiredInput(inputName: 'Date'),
        SizedBox(height: 10),
        DatePickerInput(expenseForm: expenseForm),
        SizedBox(height: 40),
      ],
    );
  }
}

class _DropDownType extends StatefulWidget {
  const _DropDownType({required this.expenseForm, required this.width});

  final ExpenseFormProvider expenseForm;
  final double width;

  @override
  State<_DropDownType> createState() => _DropDownTypeState();
}

class _DropDownTypeState extends State<_DropDownType> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExpenseTypesProvider>(
        context,
        listen: false,
      ).fetchGetAllExpenseTypes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseTypesProvider>(
      builder: (_, provider, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputTexts.requiredInput(inputName: "Expense Types"),
            const SizedBox(height: 8),

            DropdownButtonFormField<ExpenseType>(
              dropdownColor: Colors.white,
              value: widget.expenseForm.expenseType,
              onChanged: (ExpenseType? selected) {
                if (selected != null) {
                  widget.expenseForm.expenseType = selected;
                }
              },
              validator: (value) {
                if (value == null) return 'Please select an expense type';
                return null;
              },
              items: provider.isLoading
                  ? [
                      DropdownMenuItem<ExpenseType>(
                        value: null,
                        child: Text(
                          'Cargando...',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ]
                  : provider.expenseTypes.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(capitalizeFirstLetter(type.name)),
                      );
                    }).toList(),
              decoration: const InputDecoration(
                hintText: 'Select a type',
                border: OutlineInputBorder(),
              ),
              hint: Text(
                'Select Type',
                style: TextStyle(color: Colors.grey), 
              ),  
              icon: Icon(Icons.arrow_drop_down, color: AppTheme.primaryColor),
            ),

            const SizedBox(height: 25),
          ],
        );
      },
    );
  }
}

class _AmountInput extends StatefulWidget {
  const _AmountInput({required this.onChanged});

  final void Function(double value) onChanged;

  @override
  State<_AmountInput> createState() => _AmountInputState();
}

class _AmountInputState extends State<_AmountInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hasAutoCompleted = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputTexts.requiredInput(inputName: 'Amount'),

        TextFormField(
          controller: _controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          autocorrect: false,
          style: TextStyle(fontSize: 16),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d{0,8}(\.\d{0,3})?$')),
          ],
          decoration: InputDecorations.formInputDecoration(
            hintText: 'Enter amount',
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Amount is required';
            }

            final amount = double.tryParse(value);
            if (amount == null || amount <= 0) {
              return 'Enter a valid amount';
            }
            return null;
          },
          onChanged: (value) {
            if (!hasAutoCompleted && value == '0') {
              final newValue = '0.';
              _controller.text = newValue;
              _controller.selection = TextSelection.fromPosition(
                TextPosition(offset: newValue.length),
              );
              widget.onChanged(0.0);
              hasAutoCompleted = true;
            }

            if (value == '.') {
              final newValue = '0.';
              _controller.text = newValue;
              _controller.selection = TextSelection.fromPosition(
                TextPosition(offset: newValue.length),
              );
              widget.onChanged(0.0);
              return;
            }

            if (value.isEmpty) {
              hasAutoCompleted = false;
            }

            widget.onChanged(double.tryParse(value) ?? 0.0);
          },
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
        InputTexts.requiredInput(inputName: 'Description'),

        TextFormField(
          maxLength: 50,
          autocorrect: false,
          style: TextStyle(fontSize: 16),
          decoration: InputDecorations.formInputDecoration(
            hintText: 'Add a short description',
          ),
          onChanged: (value) => expenseForm.description = value,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Description is required';
            }

            if (value.length > 50) {
              return 'Maximum 50 characters';
            }

            return null;
          },
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
