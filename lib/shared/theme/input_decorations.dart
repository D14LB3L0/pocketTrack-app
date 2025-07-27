import 'package:flutter/material.dart';

import 'app_theme.dart';

class InputDecorations {
  static InputDecoration formInputDecoration({required String hintText}) {
    return InputDecoration(hintText: hintText, hintStyle: TextStyle(color: Colors.grey));
  }

  static InputDecoration formDatePickerDecoration() {
    return InputDecoration(
      hintText: 'Select Date',
      prefixIcon: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 24),
        child: Icon(
          Icons.calendar_today,
          size: 20,
          color: AppTheme.primaryColor,
        ),
      ),
      border: UnderlineInputBorder(),
    );
  }
}
