import 'package:flutter/material.dart';

import '../theme/constants.dart';
import '../theme/style.dart';

// ignore: must_be_immutable
class UserPhoneNumberWidget extends StatelessWidget {

     String? countryCode ;

  String countryCode;


     UserPhoneNumberWidget({required this.countryCode});

     static String phoneText = '';
     static String getPhoneText() {
       return phoneText;
     }
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
          child: SizedBox(
            height: 40,
            child: TextField(
              decoration: const InputDecoration(hintText: "Phone Number"),
              onChanged: (value){
                phoneText = value;
              },
            ),
          ),
        ),
      ],
    );
  }
}
