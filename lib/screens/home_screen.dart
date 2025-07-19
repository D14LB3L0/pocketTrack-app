import 'package:flutter/material.dart';
import 'package:pocket_track/widgets/expense_total_card.dart';

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
              ExpenseTotalCard(totalExpenses: 2000.151331,),
            ],
          ),
        ),
      ),
    );
  }
}
