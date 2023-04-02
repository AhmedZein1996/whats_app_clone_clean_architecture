import 'package:flutter/material.dart';

import '../theme/constants.dart';
import '../theme/style.dart';

class AppDescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text(''),
            Text(
              'Verify your phone number',
              style: TextStyle(
                fontSize: 18,
                color: greenColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.more_vert),
          ],
        ),
        sizedBoxHeight30,
        const Text(
          "WhatsApp Clone will send and SMS message (carrier charges may apply) to verify your phone number. Enter your country code and phone number:",
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
