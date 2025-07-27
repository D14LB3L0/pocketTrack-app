import 'package:flutter/material.dart';
import 'package:pocket_track/shared/theme/app_theme.dart';
import 'package:pocket_track/shared/utils/utils.dart';

class ExpenseTotalCard extends StatelessWidget {
  final double totalExpenses;

  const ExpenseTotalCard({super.key, required this.totalExpenses});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.6,
      height: 120,
      decoration: _decoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total Expenses',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'S/. ${formatToTwoDecimals(totalExpenses)}',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppTheme.primaryColor,
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
      ],
    );
  }
}
