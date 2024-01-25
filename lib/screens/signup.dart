import 'package:e_commerce_demo_flutter/models/user.dart';
import 'package:e_commerce_demo_flutter/screens/bottom_navigation.dart';
import 'package:e_commerce_demo_flutter/screens/login.dart';
import 'package:e_commerce_demo_flutter/services/auth/auth_api_service.dart';
import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_input.dart';
import 'package:e_commerce_demo_flutter/widgets/traingle_button_alternative.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  final AuthApiService authApiService;
  const SignUp({super.key, required this.authApiService});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool textObsecured = true;
  bool buttonDisabled = true;
  bool agreed = false;
  late User currentUser;
  void _iconPressed() {
    textObsecured = !textObsecured;
    setState(() {});
  }

  void _signup() async {
    try {
      await widget.authApiService.signup(
          fNameController.text,
          lNameController.text,
          phoneController.text,
          emailController.text,
          passwordController.text);
      // Fluttertoast.showToast(
      //     msg: "Sign up successful",
      //     toastLength: Toast.LENGTH_SHORT,
      //     textColor: Colors.white,
      //     fontSize: 16,
      //     backgroundColor: Colors.green[250]);
      _navigateToLogin();
    } catch (e) {
      if (e == 'Exception: 403') {
        // Fluttertoast.showToast(
        //     msg: "Sign up failed",
        //     toastLength: Toast.LENGTH_SHORT,
        //     textColor: Colors.white,
        //     fontSize: 16,
        //     backgroundColor: Colors.red[500]);
        debugPrint(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigation(),
                      ),
                    );
                  },
                  child: const Text('Skip'),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .02),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: MediaQuery.sizeOf(context).width * .06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .02),
              RoundedInput(
                label: "First name",
                inputController: fNameController,
                iconSuffix: null,
                textObsecured: false,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .04),
              RoundedInput(
                label: "Last name",
                inputController: lNameController,
                iconSuffix: null,
                textObsecured: false,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .04),
              RoundedInput(
                label: "Email",
                inputController: emailController,
                iconSuffix: null,
                textObsecured: false,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .04),
              RoundedInput(
                label: "Phone number",
                inputController: phoneController,
                iconSuffix: null,
                textObsecured: false,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .04),
              RoundedInput(
                label: "Password",
                inputController: passwordController,
                iconSuffix: textObsecured
                    ? Container(
                        padding: EdgeInsets.only(
                          right: MediaQuery.sizeOf(context).width * .03,
                        ),
                        child: IconButton(
                            onPressed: _iconPressed,
                            icon: const Icon(Icons.visibility)),
                      )
                    : Container(
                        padding: EdgeInsets.only(
                          right: MediaQuery.sizeOf(context).width * .03,
                        ),
                        child: IconButton(
                            onPressed: _iconPressed,
                            icon: const Icon(Icons.visibility_off)),
                      ),
                textObsecured: textObsecured,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).width * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      value: agreed,
                      onChanged: (value) {
                        agreed = value!;
                        setState(() {});
                      }),
                  const Text("I Agree with"),
                  TextButton(
                    child: const Text("Privacy"),
                    onPressed: () {},
                  ),
                  const Text("and"),
                  TextButton(
                    child: const Text("Policy"),
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).height * .01,
                    horizontal: MediaQuery.sizeOf(context).width * .02),
                child: TraingleButton(
                  buttonClicked: _signup,
                  buttonDisabled: buttonDisabled,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    child: const Text("Sign In"),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(
                            authApiService: widget.authApiService,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(
          authApiService: widget.authApiService,
        ),
      ),
    );
  }
}
