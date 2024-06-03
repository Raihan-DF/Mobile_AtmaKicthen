import 'dart:convert';
import 'package:atmakitchen/service/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atmakitchen/models/product.dart';

class AuthService {
  // Controller Register
  String endPointLogin = endPoint + loginControl;
  static Future<http.Response> register(
      String nama,
      String email,
      String username,
      String password,
      String tanggal_lahir,
      String no_telp,
      int id_role) async {
    Map data = {
      'nama': nama,
      'email': email,
      'username': username,
      'password': password,
      'tanggal_lahir': tanggal_lahir,
      'no_telp': no_telp,
      'id_role': id_role,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  // Controller login
  Future<Map<String, dynamic>> login(
      TextEditingController username, TextEditingController password) async {
    try {
      print("username: {$username}");
      print("password: {$password}");
      var response = await http.post(
        Uri.http(baseURL, endPointLogin),
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode({"username": username.text, "password": password.text}),
      );
      print("masuk isini");
      print(response.body);

      if (response.statusCode == 200) {
        // Parse response body
        Map<String, dynamic> responseBody = json.decode(response.body);
        // Extract access token
        String accessToken = responseBody['access_token'];
        // Store access token in shared preferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken);

        print('Access Token: $accessToken');

        // Return response body along with access token
        return responseBody;
      } else if (response.statusCode == 401) {
        // Invalid login credentials
        throw Exception('Invalid username & password match!');
      } else if (response.statusCode == 400) {
        // Validation error or unverified email
        Map<String, dynamic> responseBody = json.decode(response.body);
        String errorMessage = responseBody['message'];
        if (errorMessage == 'Email Anda Belum Di verifikasi!') {
          // Handle unverified email error
          throw Exception(errorMessage);
        } else {
          // Handle other validation errors
          throw Exception('Validation error: $errorMessage');
        }
      } else {
        // Handle other status codes
        throw Exception(
            'Failed with status: ${response.statusCode} and reason: ${response.reasonPhrase}');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  
}
