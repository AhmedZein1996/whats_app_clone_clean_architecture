import 'package:flutter/material.dart';

import '../theme/constants.dart';
import '../theme/style.dart';

class UserPhoneNumberWidget extends StatelessWidget {
  String countryCode;

  UserPhoneNumberWidget({required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.50,
                color: greenColor,
              ),
            ),
          ),
          width: 80,
          height: 42,
          alignment: Alignment.center,
          child: Text('+$countryCode'),
        ),
        sizedBoxWidth8,
        Expanded(
          child: Container(
            height: 40,
            child: const TextField(
              decoration: InputDecoration(hintText: "Phone Number"),
            ),
          ),
        ),
      ],
    );
  }
}
