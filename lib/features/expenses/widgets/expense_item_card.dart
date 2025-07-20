import 'package:flutter/material.dart';
import 'package:pocket_track/shared/theme/app_theme.dart';

import '../../../shared/widgets/widgets.dart';

class ExpenseItemCard extends StatelessWidget {
  const ExpenseItemCard({super.key});

  @override
  Widget build(BuildContext context) {

    return CardContainer(
      height: 110,
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
    );
  }
}

class _ExpenseActions extends StatelessWidget {
  const _ExpenseActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: AppTheme.secondaryColor),
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
  const _ExpenseItemDetails();

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
