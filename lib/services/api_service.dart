import 'package:e_commerce_demo_flutter/models/user.dart';
import 'package:e_commerce_demo_flutter/services/api_methods/login.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  // Future<List<Note>> fetchNotes() async {
  //   return retrieveNotes('$baseUrl/note/load/');
  // }

  Future<User> login(String email, String password) async {
    return loginApi('$baseUrl/user/login/', email, password);
  }
}
