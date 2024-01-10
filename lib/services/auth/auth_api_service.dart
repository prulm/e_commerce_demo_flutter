import 'package:e_commerce_demo_flutter/services/auth/api_methods/login_method.dart';
import 'package:e_commerce_demo_flutter/services/auth/api_methods/signup_method.dart';
import 'package:e_commerce_demo_flutter/utils/constants.dart';

class AuthApiService {
  final String baseUrl;

  AuthApiService() : baseUrl = apiUrl;

  Future login(String email, String password) async {
    return loginApi('$baseUrl/user/login.php', email, password);
  }
  Future signup(String firstName, String lastName, String phone, String email, String password) async {
    return signupApi('$baseUrl/user/signup.php', firstName, lastName, phone, email, password);
  }
}