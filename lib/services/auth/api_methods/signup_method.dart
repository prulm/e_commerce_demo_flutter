import 'dart:convert';
import 'package:http/http.dart' as http;

Future signupApi(String url, String firstName, String lastName, String phone, String email, String password) async {
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
