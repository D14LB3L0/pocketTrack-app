import 'dart:convert';

class GetTotalExpenseResponse {
    bool success;
    int code;
    String message;
    double data;

    GetTotalExpenseResponse({
        required this.success,
        required this.code,
        required this.message,
        required this.data,
    });

    factory GetTotalExpenseResponse.fromJson(String str) => GetTotalExpenseResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetTotalExpenseResponse.fromMap(Map<String, dynamic> json) => GetTotalExpenseResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "code": code,
        "message": message,
        "data": data,
    };
}
