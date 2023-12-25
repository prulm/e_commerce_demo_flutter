import 'package:e_commerce_demo_flutter/models/user.dart';
import 'package:e_commerce_demo_flutter/screens/signup.dart';
import 'package:e_commerce_demo_flutter/services/auth/auth_api_service.dart';
import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_input.dart';
import 'package:e_commerce_demo_flutter/widgets/traingle_button_alternative.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final AuthApiService authApiService;
  const Login({super.key, required this.authApiService});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late User currentUser;
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
  void initState() {
    _login();
    super.initState();
  }

  _login() async {
    try {
      User fetchedUser = await widget.authApiService.login(
          emailController.text, passwordController.text);
      setState(() {
        currentUser = fetchedUser;
      });
    } catch (e) {
      print('Error Logging you in: $e');
    }
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
                height: MediaQuery.sizeOf(context).height * .05,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Skip'),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .02),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).width * .06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .04),
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
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).width * .05,
                    horizontal: MediaQuery.sizeOf(context).width * .02),
                child: const TraingleButton(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    child: const Text("Sign Up"),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(authApiService: widget.authApiService),
                        ),
                      );
                    },
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
              SizedBox(
                height: MediaQuery.sizeOf(context).width * .23,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: icons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: icons.length),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * .04),
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
