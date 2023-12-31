import 'dart:convert';
import 'package:http/http.dart' as http;

Future signupApi(String url, String firstName, String lastName, String phone, String email, String password) async {
  final response = await http.post(
    Uri.parse(url),
    body: {"firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "password": password},
  );
 
  if (response.statusCode == 201) {
    dynamic data = json.decode(response.body);
    return data;
  } else {
    throw Exception(json.decode(response.statusCode.toString()));
  }
}
