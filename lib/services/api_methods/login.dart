import 'dart:convert';
import 'package:e_commerce_demo_flutter/models/user.dart';
import 'package:http/http.dart' as http;

Future<User> loginApi(String url, email, password) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: {"email": email, "password": password},
  );

  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    return User.fromMap(data);
  } else {
    throw Exception('Failed to login');
  }
}
