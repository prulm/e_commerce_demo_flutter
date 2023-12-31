import 'package:e_commerce_demo_flutter/widgets/custombuttonshape.dart';
import 'package:flutter/material.dart';

class TraingleButton extends StatelessWidget {
  final VoidCallback buttonClicked;
  final bool buttonDisabled;
  const TraingleButton({super.key, required this.buttonClicked, required this.buttonDisabled});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TraingleButtonClipper(),
      child: ElevatedButton(
        onPressed: buttonDisabled ? null : buttonClicked,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
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
