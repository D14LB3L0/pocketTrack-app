import 'package:flutter/material.dart';
import 'package:pocket_track/routes/app_routes.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  itemCount: 5,
                  itemBuilder: (_, int index) =>
                      Align(child: ExpenseItemCard()),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                ),
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      floatingActionButton: Transform.translate(
        offset: Offset(0, -25),
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
