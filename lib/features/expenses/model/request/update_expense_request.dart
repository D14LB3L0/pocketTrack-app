import 'package:intl/intl.dart';

class UpdateExpenseRequest {
  int id;
  String description;
  double amount;
  int expenseTypeId;
  DateTime spentAt;

  UpdateExpenseRequest({
    required this.id,
    required this.description,
    required this.amount,
    required this.expenseTypeId,
    required this.spentAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'description': description,
    'amount': amount,
    'expenseTypeId': expenseTypeId,
    'spentAt': DateFormat('yyyy-MM-dd').format(spentAt),
  };
}
