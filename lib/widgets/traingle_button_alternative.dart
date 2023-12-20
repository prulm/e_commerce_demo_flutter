import 'package:e_commerce_demo_flutter/widgets/custombuttonshape.dart';
import 'package:flutter/material.dart';

class TraingleButton extends StatelessWidget {
  const TraingleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TraingleButtonClipper(),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.black,
            alignment: Alignment.center,
            backgroundColor: Colors.deepPurple,
            padding: const EdgeInsets.all(25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Transform.translate(
          offset: Offset(6, 0),
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
