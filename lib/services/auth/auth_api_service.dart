import 'package:e_commerce_demo_flutter/models/user.dart';
import 'package:e_commerce_demo_flutter/services/auth/api_methods/login_method.dart';
import 'package:e_commerce_demo_flutter/utils/constants.dart';

class ApiService {
  final String baseUrl;

  ApiService() : baseUrl = apiUrl;

  // Future<List<Note>> fetchNotes() async {
  //   return retrieveNotes('$baseUrl/note/load/');
  // }

  Future<User> login(String email, String password) async {
    return loginApi('$baseUrl/user/login/', email, password);
  }
}
