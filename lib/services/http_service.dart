import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sabka_bazaar/models/product_list_model.dart';

class HttpService {
  // Mimic the API call from local JSON Model
  static Future<List<Item>?> fetchProducts() async {
    var response =
    await rootBundle.loadString('assets/json/home.json');
    final data = await json.decode(response);
    ProductItem allData = ProductItem.fromJson(data);
    return allData.items;
  }
}