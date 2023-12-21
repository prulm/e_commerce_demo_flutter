import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_input.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool textObsecured = true;
  void iconPressed() {
    textObsecured = !textObsecured;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .1,
              vertical: MediaQuery.sizeOf(context).height * .05),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Skip'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).width * .04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RoundedInput(
                label: "Email/Phone number",
                inputController: emailController,
                iconSuffix: null,
                textObsecured: false,
              ),
              RoundedInput(
                label: "Password",
                inputController: passwordController,
                iconSuffix: textObsecured
                    ? IconButton(
                        onPressed: iconPressed,
                        icon: const Icon(Icons.visibility))
                    : IconButton(
                        onPressed: iconPressed,
                        icon: const Icon(Icons.visibility_off)),
                textObsecured: textObsecured,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
