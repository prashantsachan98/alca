// To parse this JSON data, do
//
//     final fetchedBan = fetchedBanFromJson(jsonString);

import 'dart:convert';

List<FetchedBan> fetchedBanFromJson(String str) => List<FetchedBan>.from(json.decode(str).map((x) => FetchedBan.fromJson(x)));

String fetchedBanToJson(List<FetchedBan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchedBan {
    FetchedBan({
        this.id,
        this.title,
        this.image,
        this.productId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.categoryId,
    });

    int id;
    String title;
    String image;
    dynamic productId;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic categoryId;

    factory FetchedBan.fromJson(Map<String, dynamic> json) => FetchedBan(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        productId: json["product_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "product_id": productId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category_id": categoryId,
    };
}
