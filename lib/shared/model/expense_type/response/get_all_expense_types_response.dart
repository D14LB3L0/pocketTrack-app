import 'dart:convert';

import '../expense_type.dart';

class GetAllExpenseTypeResponse {
    bool success;
    int code;
    String message;
    List<ExpenseType> data;

    GetAllExpenseTypeResponse({
        required this.success,
        required this.code,
        required this.message,
        required this.data,
    });

    factory GetAllExpenseTypeResponse.fromJson(String str) => GetAllExpenseTypeResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetAllExpenseTypeResponse.fromMap(Map<String, dynamic> json) => GetAllExpenseTypeResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: List<ExpenseType>.from(json["data"].map((x) => ExpenseType.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

