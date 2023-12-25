import 'package:e_commerce_demo_flutter/screens/home.dart';
import 'package:e_commerce_demo_flutter/services/auth/auth_api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ECommerce());
}

class ECommerce extends StatelessWidget {
  ECommerce({super.key});

  final AuthApiService authApiService = AuthApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Demo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(apiService: authApiService),
    );
  }
}
