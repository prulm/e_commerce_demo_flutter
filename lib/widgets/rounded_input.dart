import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  final iconSuffix;
  final String label;
  final bool textObsecured;
  final TextEditingController inputController;
  const RoundedInput({
    super.key,
    required this.iconSuffix,
    required this.label,
    required this.textObsecured,
    required this.inputController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .9,
      child: TextField(
        obscureText: textObsecured,
        controller: inputController,
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(
            color: Colors.grey,
            backgroundColor: Colors.white,
          ),
          contentPadding:
              EdgeInsets.only(left: MediaQuery.sizeOf(context).width * .07),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: iconSuffix,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.1),
          ),
        ),
      ),
    );
  }
}
