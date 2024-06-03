import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';

const String baseURL = "10.0.2.2:8000";
String endPoint = "/api";
String loginControl = "/login";
const Map<String, String> headers = {
  'Content-Type': 'application/json',
};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: const Color.fromARGB(255, 196, 70, 61),
      duration: const Duration(seconds: 1),
    ),
  );
}
