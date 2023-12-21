import 'package:e_commerce_demo_flutter/screens/login.dart';
import 'package:e_commerce_demo_flutter/screens/signup.dart';
import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:e_commerce_demo_flutter/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void buttonPressed(BuildContext context, String action) {
    if (action == 'Signup') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUp(),
        ),
      );
    } else if (action == 'Login') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey,
      body: Padding(
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
            Expanded(
                flex: 3, child: Image.asset('assets/images/landing_1.png')),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButton(
                    text: 'Log In',
                    heightFactor: .07,
                    widthFactor: .9,
                    buttonPressed: () => buttonPressed(context, 'Login'),
                  ),
                  RoundedButton(
                    text: 'Sign Up',
                    heightFactor: .07,
                    widthFactor: .9,
                    buttonPressed: () => buttonPressed(context, 'Signup'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
