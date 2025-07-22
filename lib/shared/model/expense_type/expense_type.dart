import 'dart:convert';

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
