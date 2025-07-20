import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocket_track/theme/app_theme.dart';

class DatePickerInput extends StatefulWidget {
  @override
  _DatePickerInputState createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Select Date',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 24), // Ajusta verticalmente
          child: Icon(Icons.calendar_today, size: 20, color: AppTheme.primaryColor),
        ),
        border: UnderlineInputBorder(),
      ),

      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: _selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          setState(() {
            _selectedDate = picked;
            _controller.text = DateFormat('dd/MM/yyyy').format(picked);
          });
        }
      },
    );
  }
}
