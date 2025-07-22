import 'dart:convert';

class ExpenseTypesResponse {
    bool success;
    int code;
    String message;
    List<ExpenseType> data;

    ExpenseTypesResponse({
        required this.success,
        required this.code,
        required this.message,
        required this.data,
    });

    factory ExpenseTypesResponse.fromJson(String str) => ExpenseTypesResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExpenseTypesResponse.fromMap(Map<String, dynamic> json) => ExpenseTypesResponse(
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

class ExpenseType {
    int id;
    String name;

    ExpenseType({
        required this.id,
        required this.name,
    });

    factory ExpenseType.fromJson(String str) => ExpenseType.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExpenseType.fromMap(Map<String, dynamic> json) => ExpenseType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}
