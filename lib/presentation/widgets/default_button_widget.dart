import 'package:flutter/material.dart';

import '../theme/style.dart';

// ignore: must_be_immutable
class DefaultButtonWidget extends StatelessWidget {
  Function onPressed;

  DefaultButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: MaterialButton(
          color: greenColor,
          onPressed: () => onPressed(),
          child: const Text(
            "Next",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
