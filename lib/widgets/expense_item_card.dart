import 'package:flutter/material.dart';
import 'package:pocket_track/theme/app_theme.dart';

class ExpenseItemCard extends StatelessWidget {
  const ExpenseItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Opacity(
      opacity: 0.8,
      child: Container(
        width: width * 0.9,
        height: 110,
        decoration: _decoration(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.drive_eta, size: 50, color: AppTheme.primaryColor),

              SizedBox(width: 20),

              _ExpenseItemDetails(),

              SizedBox(width: 20),

              _ExpenseActions(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white70,
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
    ],
  );
}

class _ExpenseActions extends StatelessWidget {
  const _ExpenseActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: AppTheme.primaryColor),
          onPressed: () {
            // Handle edit action
          },
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            // Handle delete action
          },
        ),
      ],
    );
  }
}

class _ExpenseItemDetails extends StatelessWidget {
  const _ExpenseItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Information about the expense',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Expense type: ',
                style: TextStyle(fontSize: 14, color: AppTheme.primaryColor),
              ),
              Text(
                'S/. 250.00',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Date: ',
                style: TextStyle(fontSize: 14, color: AppTheme.primaryColor),
              ),
              Text(
                '01-10-2025',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
