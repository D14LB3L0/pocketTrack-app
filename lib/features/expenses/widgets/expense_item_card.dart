import 'package:flutter/material.dart';
import 'package:pocket_track/features/expenses/model/model.dart';
import 'package:pocket_track/routes/app_routes.dart';
import 'package:pocket_track/shared/theme/theme.dart';
import 'package:pocket_track/shared/utils/format_utils.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/widgets.dart';
import '../providers/expense_provider.dart';

class ExpenseItemCard extends StatelessWidget {
  const ExpenseItemCard({super.key, required this.expense});

  final Expense expense;

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
            expenseTypeIcon(expense.expenseType.name),

            SizedBox(width: 20),

            _ExpenseItemDetails(
              description: expense.description,
              amount: expense.amount,
              spentAt: expense.spentAt,
            ),

            SizedBox(width: 20),

            _ExpenseActions(expense: expense),
          ],
        ),
      ),
    );
  }
}

class _ExpenseActions extends StatelessWidget {
  const _ExpenseActions({required this.expense});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: AppTheme.secondaryColor),
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.formExpense,
              arguments: expense,
            );
          },
        ),
        expenseProvider.deletingExpenseId == expense.id
            ? IconButton(
                icon: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
                onPressed: null,
              )
            : IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  final expenseProvider = Provider.of<ExpenseProvider>(
                    context,
                    listen: false,
                  );
                  await expenseProvider.deleteExpense(expense.id);

                  await expenseProvider.fetchGetAllExpenses();
                },
              ),
      ],
    );
  }
}

class _ExpenseItemDetails extends StatelessWidget {
  const _ExpenseItemDetails({
    required this.description,
    required this.amount,
    required this.spentAt,
  });

  final String description;
  final double amount;
  final DateTime spentAt;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            capitalizeFirstLetter(description),
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
                formatToTwoDecimals(amount),
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
                formattedDate(spentAt),
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
