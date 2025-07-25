import 'package:flutter/material.dart';
import 'package:pocket_track/features/expenses/providers/providers.dart';
import 'package:provider/provider.dart';

// own
import '../../../shared/widgets/widgets.dart';
import 'package:pocket_track/routes/app_routes.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExpenseProvider>(
        context,
        listen: false,
      ).fetchGetAllExpenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Pocket Track')),
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              ExpenseTotalCard(totalExpenses: 2590.151331),

              SizedBox(height: 40),

              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: expenseProvider.expenses.length,
                  itemBuilder: (_, int index) => Align(
                    child: ExpenseItemCard(
                      expense: expenseProvider.expenses[index],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addExpense);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
