import 'package:e_commerce_demo_flutter/services/product/api_methods/update_method.dart';
import 'package:e_commerce_demo_flutter/services/product/api_methods/upload_method.dart';
import 'package:e_commerce_demo_flutter/utils/constants.dart';

class AuthApiService {
  final String baseUrl;

  AuthApiService() : baseUrl = apiUrl;

  Future upload(String email, String password) async {
    return uploadApi('$baseUrl/user/login.php', email, password);
  }
  Future update(String firstName, String lastName, String phone, String email, String password) async {
    return updateApi('$baseUrl/user/signup.php', firstName, lastName);
  }
}