import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocket_track/shared/theme/input_decorations.dart';

import '../../features/expenses/providers/providers.dart';

class DatePickerInput extends StatefulWidget {
  ExpenseFormProvider expenseForm;

  DatePickerInput({super.key, required this.expenseForm});
  
  @override
  _DatePickerInputState createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _controller.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
    widget.expenseForm.date = _selectedDate!;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecorations.formDatePickerDecoration(),
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: _selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() {
            _selectedDate = picked;
            _controller.text = DateFormat('dd/MM/yyyy').format(picked);
            widget.expenseForm.date = picked;
          });
        }
      },
    );
  }
}
