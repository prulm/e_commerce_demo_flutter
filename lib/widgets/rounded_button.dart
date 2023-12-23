import 'package:e_commerce_demo_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double heightFactor;
  final double widthFactor;
  final VoidCallback buttonPressed;
  const RoundedButton({
    super.key,
    required this.text,
    required this.heightFactor,
    required this.widthFactor,
    required this.buttonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * widthFactor,
      height: MediaQuery.sizeOf(context).height * heightFactor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: buttonPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.sizeOf(context).aspectRatio * 28,
          ),
        ),
      ),
    );
  }
}
