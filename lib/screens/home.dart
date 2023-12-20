import 'package:e_commerce_demo_flutter/widgets/custombuttonshape.dart';
import 'package:flutter/material.dart';
import 'package:polygon/polygon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Text('Skip'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
