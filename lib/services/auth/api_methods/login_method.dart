import 'dart:convert';
import 'package:e_commerce_demo_flutter/models/user.dart';
import 'package:http/http.dart' as http;

Future loginApi(String url, email, password) async {
  final response = await http.post(
    Uri.parse(url),
    body: {"email": email, "password": password},
  );

  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body);
    return data["token"];
  } else {
    throw Exception(response.body);
  }
}
