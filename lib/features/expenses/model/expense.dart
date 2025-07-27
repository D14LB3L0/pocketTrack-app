
import 'dart:convert';

import '../../../shared/model/expense_type/expense_type.dart';

class Expense {
    int id;
    String description;
    double amount;
    DateTime spentAt;
    ExpenseType expenseType;

    Expense({
        required this.id,
        required this.description,
        required this.amount,
        required this.spentAt,
        required this.expenseType,
    });

    factory Expense.fromJson(String str) => Expense.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Expense.fromMap(Map<String, dynamic> json) => Expense(
        id: json["id"],
        description: json["description"],
        amount: json["amount"],
        spentAt: DateTime.parse(json["spentAt"]),
        expenseType: ExpenseType.fromMap(json["expenseType"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "amount": amount,
        "spentAt": "${spentAt.year.toString().padLeft(4, '0')}-${spentAt.month.toString().padLeft(2, '0')}-${spentAt.day.toString().padLeft(2, '0')}",
        "expenseType": expenseType.toMap(),
    };
}

