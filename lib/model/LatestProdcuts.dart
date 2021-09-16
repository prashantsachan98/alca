// To parse this JSON data, do
//
//     final fetchedLatestProducts = fetchedLatestProductsFromJson(jsonString);

import 'dart:convert';

FetchedLatestProducts fetchedLatestProductsFromJson(String str) => FetchedLatestProducts.fromJson(json.decode(str));

String fetchedLatestProductsToJson(FetchedLatestProducts data) => json.encode(data.toJson());

class FetchedLatestProducts {
    FetchedLatestProducts({
        this.totalSize,
        this.limit,
        this.offset,
        this.products,
    });

    int totalSize;
    dynamic limit;
    dynamic offset;
    List<Product> products;

    factory FetchedLatestProducts.fromJson(Map<String, dynamic> json) => FetchedLatestProducts(
        totalSize: json["total_size"],
        limit: json["limit"],
        offset: json["offset"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "limit": limit,
        "offset": offset,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.id,
        this.name,
        this.description,
        this.image,
        this.price,
        this.variations,
        this.tax,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.attributes,
        this.categoryIds,
        this.choiceOptions,
        this.discount,
        this.discountType,
        this.taxType,
        this.unit,
        this.totalStock,
        this.capacity,
        this.dailyNeeds,
        this.wishlistCount,
        this.rating,
    });

    int id;
    String name;
    String description;
    List<String> image;
    int price;
    List<dynamic> variations;
    int tax;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    List<dynamic> attributes;
    List<CategoryId> categoryIds;
    List<dynamic> choiceOptions;
    int discount;
    Type discountType;
    Type taxType;
    Unit unit;
    int totalStock;
    int capacity;
    int dailyNeeds;
    int wishlistCount;
    List<dynamic> rating;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: List<String>.from(json["image"].map((x) => x)),
        price: json["price"],
        variations: List<dynamic>.from(json["variations"].map((x) => x)),
        tax: json["tax"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        categoryIds: List<CategoryId>.from(json["category_ids"].map((x) => CategoryId.fromJson(x))),
        choiceOptions: List<dynamic>.from(json["choice_options"].map((x) => x)),
        discount: json["discount"],
        discountType: typeValues.map[json["discount_type"]],
        taxType: typeValues.map[json["tax_type"]],
        unit: unitValues.map[json["unit"]],
        totalStock: json["total_stock"],
        capacity: json["capacity"],
        dailyNeeds: json["daily_needs"],
        wishlistCount: json["wishlist_count"],
        rating: List<dynamic>.from(json["rating"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": List<dynamic>.from(image.map((x) => x)),
        "price": price,
        "variations": List<dynamic>.from(variations.map((x) => x)),
        "tax": tax,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "category_ids": List<dynamic>.from(categoryIds.map((x) => x.toJson())),
        "choice_options": List<dynamic>.from(choiceOptions.map((x) => x)),
        "discount": discount,
        "discount_type": typeValues.reverse[discountType],
        "tax_type": typeValues.reverse[taxType],
        "unit": unitValues.reverse[unit],
        "total_stock": totalStock,
        "capacity": capacity,
        "daily_needs": dailyNeeds,
        "wishlist_count": wishlistCount,
        "rating": List<dynamic>.from(rating.map((x) => x)),
    };
}

class CategoryId {
    CategoryId({
        this.id,
        this.position,
    });

    String id;
    int position;

    factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json["id"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
    };
}

enum Type { PERCENT }

final typeValues = EnumValues({
    "percent": Type.PERCENT
});

enum Unit { GM, PC, KG }

final unitValues = EnumValues({
    "gm": Unit.GM,
    "kg": Unit.KG,
    "pc": Unit.PC
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
