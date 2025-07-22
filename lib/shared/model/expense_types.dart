import 'dart:convert';

class ExpenseTypes {
    bool success;
    int code;
    String message;
    List<Datum> data;

    ExpenseTypes({
        required this.success,
        required this.code,
        required this.message,
        required this.data,
    });

    factory ExpenseTypes.fromJson(String str) => ExpenseTypes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ExpenseTypes.fromMap(Map<String, dynamic> json) => ExpenseTypes(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Datum {
    int id;
    String name;

    Datum({
        required this.id,
        required this.name,
    });

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}
