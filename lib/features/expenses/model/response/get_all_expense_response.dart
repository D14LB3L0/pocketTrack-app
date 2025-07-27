import 'dart:convert';

import '../expense.dart';


class GetAllExpenseResponse {
    bool success;
    int code;
    String message;
    List<Expense> data;

    GetAllExpenseResponse({
        required this.success,
        required this.code,
        required this.message,
        required this.data,
    });

    factory GetAllExpenseResponse.fromJson(String str) => GetAllExpenseResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetAllExpenseResponse.fromMap(Map<String, dynamic> json) => GetAllExpenseResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: List<Expense>.from(json["data"].map((x) => Expense.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}
