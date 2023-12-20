import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double heightFactor;
  final double widthFactor;
  const RoundedButton({
    super.key,
    required this.text,
    required this.heightFactor,
    required this.widthFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * widthFactor,
      height: MediaQuery.sizeOf(context).height * heightFactor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          onPrimary: Colors.white,
          // padding: EdgeInsets.symmetric(
          //     horizontal: MediaQuery.sizeOf(context).width * .3,
          //     vertical: 0)
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
