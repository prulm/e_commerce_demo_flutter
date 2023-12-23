import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_input.dart';
import 'package:e_commerce_demo_flutter/widgets/traingle_button_alternative.dart';
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
  List<Map> icons = [
    {"name": "facebook", "url": kFbLink},
    {"name": "google", "url": kGoogleLink},
    {"name": "instagram", "url": kInstaLink},
    {"name": "twitter", "url": kXLink}
  ];
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
              SizedBox(height: MediaQuery.sizeOf(context).width * .03),
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
              SizedBox(height: MediaQuery.sizeOf(context).width * .05),
              RoundedInput(
                label: "Email/Phone number",
                inputController: emailController,
                iconSuffix: null,
                textObsecured: false,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .05),
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
              SizedBox(height: MediaQuery.sizeOf(context).width * .005),
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
              SizedBox(height: MediaQuery.sizeOf(context).width * .06),
              Container(
                alignment: Alignment.centerRight,
                child: const TraingleButton(),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .06),
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
              SizedBox(height: MediaQuery.sizeOf(context).width * .05),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: kGrey600),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .05),
              SizedBox(
                height: MediaQuery.sizeOf(context).width * .4,
                child: GridView.builder(
                  itemCount: icons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: icons.length),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * .06),
                      child: CircleAvatar(
                        child: Image.network(
                          icons[index]["url"],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
