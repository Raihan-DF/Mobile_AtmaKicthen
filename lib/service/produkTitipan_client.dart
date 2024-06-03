import 'dart:convert';
import 'package:atmakitchen/service/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atmakitchen/models/product_titipan.dart';

class ProdukTitipan_Client {
  static const String url = "10.0.2.2:8000";
  static const String endpoint = "/api/produk_titipan";
  Future<List<ProductTitipan>> fetchProducts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      print("mask1");
      final accessToken = prefs.getString('accessToken');
      print("mask2");
      var response = await http.get(
        Uri.http(url, endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      print(Uri.http(url, endpoint));

      // print("mask3");

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body)['data'];
        print(jsonResponse);
        return jsonResponse.map((produktitipan) => ProductTitipan.fromJson(produktitipan)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
// Fetch products
