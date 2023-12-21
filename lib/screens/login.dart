import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_input.dart';
import 'package:e_commerce_demo_flutter/widgets/traingle_button.dart';
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
                    ? Container(
                        padding: EdgeInsets.only(
                          right: MediaQuery.sizeOf(context).width * .03,
                        ),
                        child: IconButton(
                            onPressed: iconPressed,
                            icon: const Icon(Icons.visibility)),
                      )
                    : Container(
                        padding: EdgeInsets.only(
                          right: MediaQuery.sizeOf(context).width * .03,
                        ),
                        child: IconButton(
                            onPressed: iconPressed,
                            icon: const Icon(Icons.visibility_off)),
                      ),
                textObsecured: textObsecured,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: kGrey600,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: const TraingleButton(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    child: const Text("Sign Up"),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('OR',
                    style: TextStyle(color: kGrey600),),
                  ),
                  const Expanded(child: Divider(),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
