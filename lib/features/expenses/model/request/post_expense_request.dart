class PostExpenseRequest {
  String description;
  double amount;
  int expenseTypeId;
  DateTime spentAt;

  PostExpenseRequest({
    required this.description,
    required this.amount,
    required this.expenseTypeId,
    required this.spentAt,
  });

  Map<String, dynamic> toJson() => {
    'description': description,
    'amount': amount,
    'expenseTypeId': expenseTypeId,
    'spentAt': spentAt.toIso8601String(),
  };
}
