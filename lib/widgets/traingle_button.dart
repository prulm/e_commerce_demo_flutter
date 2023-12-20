import 'package:e_commerce_demo_flutter/widgets/custombuttonshape.dart';
import 'package:flutter/material.dart';

class TraingleButton extends StatelessWidget {
  const TraingleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomButtonClipper(),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.black,
            alignment: Alignment.center,
            backgroundColor: Colors.deepPurple,
            padding: const EdgeInsets.fromLTRB(55, 30, 55, 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Transform.translate(
          offset: const Offset(37, 0),
          child: const Icon(
            Icons.east,
            color: Colors.white,
            size: 28.0,
          ),
        ),
      ),
    );
  }
}
