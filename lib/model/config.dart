// To parse this JSON data, do
//
//     final fetchedCon = fetchedConFromJson(jsonString);

import 'dart:convert';

FetchedCon fetchedConFromJson(String str) =>
    FetchedCon.fromJson(json.decode(str));

String fetchedConToJson(FetchedCon data) => json.encode(data.toJson());

class FetchedCon {
  FetchedCon({
    this.ecommerceName,
    this.ecommerceLogo,
    this.ecommerceAddress,
    this.ecommercePhone,
    this.ecommerceEmail,
    this.ecommerceLocationCoverage,
    this.minimumOrderValue,
    this.selfPickup,
    this.baseUrls,
    this.currencySymbol,
    this.deliveryCharge,
    this.cashOnDelivery,
    this.digitalPayment,
    this.branches,
    this.termsAndConditions,
    this.privacyPolicy,
    this.aboutUs,
  });

  String ecommerceName;
  String ecommerceLogo;
  String ecommerceAddress;
  String ecommercePhone;
  String ecommerceEmail;
  EcommerceLocationCoverage ecommerceLocationCoverage;
  int minimumOrderValue;
  int selfPickup;
  BaseUrls baseUrls;
  String currencySymbol;
  String deliveryCharge;
  String cashOnDelivery;
  String digitalPayment;
  List<Branch> branches;
  String termsAndConditions;
  String privacyPolicy;
  String aboutUs;

  factory FetchedCon.fromJson(Map<String, dynamic> json) => FetchedCon(
        ecommerceName: json["ecommerce_name"],
        ecommerceLogo: json["ecommerce_logo"],
        ecommerceAddress: json["ecommerce_address"],
        ecommercePhone: json["ecommerce_phone"],
        ecommerceEmail: json["ecommerce_email"],
        ecommerceLocationCoverage: EcommerceLocationCoverage.fromJson(
            json["ecommerce_location_coverage"]),
        minimumOrderValue: json["minimum_order_value"],
        selfPickup: json["self_pickup"],
        baseUrls: BaseUrls.fromJson(json["base_urls"]),
        currencySymbol: json["currency_symbol"],
        deliveryCharge: json["delivery_charge"],
        cashOnDelivery: json["cash_on_delivery"],
        digitalPayment: json["digital_payment"],
        branches:
            List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
        termsAndConditions: json["terms_and_conditions"],
        privacyPolicy: json["privacy_policy"],
        aboutUs: json["about_us"],
      );

  Map<String, dynamic> toJson() => {
        "ecommerce_name": ecommerceName,
        "ecommerce_logo": ecommerceLogo,
        "ecommerce_address": ecommerceAddress,
        "ecommerce_phone": ecommercePhone,
        "ecommerce_email": ecommerceEmail,
        "ecommerce_location_coverage": ecommerceLocationCoverage.toJson(),
        "minimum_order_value": minimumOrderValue,
        "self_pickup": selfPickup,
        "base_urls": baseUrls.toJson(),
        "currency_symbol": currencySymbol,
        "delivery_charge": deliveryCharge,
        "cash_on_delivery": cashOnDelivery,
        "digital_payment": digitalPayment,
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
        "terms_and_conditions": termsAndConditions,
        "privacy_policy": privacyPolicy,
        "about_us": aboutUs,
      };
}

class BaseUrls {
  BaseUrls({
    this.productImageUrl,
    this.customerImageUrl,
    this.bannerImageUrl,
    this.categoryImageUrl,
    this.reviewImageUrl,
    this.notificationImageUrl,
    this.ecommerceImageUrl,
    this.deliveryManImageUrl,
    this.chatImageUrl,
  });

  String productImageUrl;
  String customerImageUrl;
  String bannerImageUrl;
  String categoryImageUrl;
  String reviewImageUrl;
  String notificationImageUrl;
  String ecommerceImageUrl;
  String deliveryManImageUrl;
  String chatImageUrl;

  factory BaseUrls.fromJson(Map<String, dynamic> json) => BaseUrls(
        productImageUrl: json["product_image_url"],
        customerImageUrl: json["customer_image_url"],
        bannerImageUrl: json["banner_image_url"],
        categoryImageUrl: json["category_image_url"],
        reviewImageUrl: json["review_image_url"],
        notificationImageUrl: json["notification_image_url"],
        ecommerceImageUrl: json["ecommerce_image_url"],
        deliveryManImageUrl: json["delivery_man_image_url"],
        chatImageUrl: json["chat_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "product_image_url": productImageUrl,
        "customer_image_url": customerImageUrl,
        "banner_image_url": bannerImageUrl,
        "category_image_url": categoryImageUrl,
        "review_image_url": reviewImageUrl,
        "notification_image_url": notificationImageUrl,
        "ecommerce_image_url": ecommerceImageUrl,
        "delivery_man_image_url": deliveryManImageUrl,
        "chat_image_url": chatImageUrl,
      };
}

class Branch {
  Branch({
    this.id,
    this.name,
    this.email,
    this.longitude,
    this.latitude,
    this.address,
    this.coverage,
  });

  int id;
  String name;
  String email;
  String longitude;
  String latitude;
  String address;
  int coverage;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        address: json["address"],
        coverage: json["coverage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "longitude": longitude,
        "latitude": latitude,
        "address": address,
        "coverage": coverage,
      };
}

class EcommerceLocationCoverage {
  EcommerceLocationCoverage({
    this.longitude,
    this.latitude,
    this.coverage,
  });

  String longitude;
  String latitude;
  int coverage;

  factory EcommerceLocationCoverage.fromJson(Map<String, dynamic> json) =>
      EcommerceLocationCoverage(
        longitude: json["longitude"],
        latitude: json["latitude"],
        coverage: json["coverage"],
      );

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
        "coverage": coverage,
      };
}
