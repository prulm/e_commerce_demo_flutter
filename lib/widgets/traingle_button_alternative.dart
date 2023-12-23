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
            foregroundColor: Colors.black,
            alignment: Alignment.center,
            backgroundColor: Colors.deepPurple,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * .035,
                vertical: MediaQuery.sizeOf(context).height * .035),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.sizeOf(context).width * .03))),
        child: Transform.translate(
          offset: Offset(MediaQuery.sizeOf(context).width * .017, 0),
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
