// To parse this JSON data, do
//
//     final fetchedCategories = fetchedCategoriesFromJson(jsonString);

import 'dart:convert';

List<FetchedCategories> fetchedCategoriesFromJson(String str) => List<FetchedCategories>.from(json.decode(str).map((x) => FetchedCategories.fromJson(x)));

String fetchedCategoriesToJson(List<FetchedCategories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchedCategories {
    FetchedCategories({
        this.id,
        this.name,
        this.parentId,
        this.position,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.image,
    });

    int id;
    String name;
    int parentId;
    int position;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    String image;

    factory FetchedCategories.fromJson(Map<String, dynamic> json) => FetchedCategories(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        position: json["position"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "position": position,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
    };
}
