import 'package:flutter/material.dart';

import 'app_theme.dart';

Icon expenseTypeIcon(String expenseType) {
  switch (expenseType.toLowerCase()) {
    case 'food':
      return Icon(size: 50, Icons.fastfood, color: AppTheme.primaryColor);
    case 'transport':
      return Icon(size: 50, Icons.directions_car, color: AppTheme.primaryColor);
    case 'entertainment':
      return Icon(size: 50, Icons.movie, color: AppTheme.primaryColor);
    case 'health':
      return Icon(
        size: 50,
        Icons.health_and_safety,
        color: AppTheme.primaryColor,
      );
    case 'education':
      return Icon(size: 50, Icons.school, color: AppTheme.primaryColor);
    default:
      return Icon(size: 50, Icons.help_outline, color: AppTheme.primaryColor);
  }
}
