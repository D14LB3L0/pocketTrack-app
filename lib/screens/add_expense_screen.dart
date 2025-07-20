import 'package:flutter/material.dart';
import 'package:pocket_track/widgets/widgets.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: CardContainer(child: Text('adsd'))
    );
  }
}
