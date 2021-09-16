import 'dart:convert' as convert;
import 'package:alca/model/LatestProdcuts.dart';
import 'package:alca/model/banner.dart';
import 'package:alca/model/categories.dart';
import 'package:alca/model/config.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

class RestApiManager {
  String _baseUrl = "grocery.mwmart.in";
  Future<FetchedCon> fetchCon() async {
    Uri ConfigUri = Uri.https(
      _baseUrl,
      '/api/v1/config',
    );

    var response = await http.get(ConfigUri);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      final ConfigData = fetchedConFromJson(response.body);

      return ConfigData;
    } else {
      return null;
    }
  }

  Future<List<FetchedBan>> fetchBan() async {
    Uri bannerUri = Uri.https(
      _baseUrl,
      '/api/v1/banners',
    );

    var response = await http.get(bannerUri);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      final ConfigData = fetchedBanFromJson(response.body);

      return ConfigData;
    } else {
      return null;
    }
  }

  Future<List<FetchedCategories>> fetchcategories() async {
    Uri categoriesUri = Uri.https(
      _baseUrl,
      '/api/v1/categories',
    );

    var response = await http.get(categoriesUri);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      final ConfigData = fetchedCategoriesFromJson(response.body);

      return ConfigData;
    } else {
      return null;
    }
  }

  Future<FetchedLatestProducts> fetchedLatestProducts() async {
    Uri latestProductUri = Uri.https(
      _baseUrl,
      '/api/v1/products/latest',
    );

    var response = await http.get(latestProductUri);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      final ConfigData = fetchedLatestProductsFromJson(response.body);

      return ConfigData;
    } else {
      return null;
    }
  }
}
