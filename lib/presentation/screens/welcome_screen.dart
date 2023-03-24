import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsappclonecleanarch/presentation/screens/registration_screen.dart';
import 'package:whatsappclonecleanarch/presentation/theme/constants.dart';
import 'package:whatsappclonecleanarch/presentation/theme/style.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 70,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Welcome to WhatsApp Clone",
              style: TextStyle(
                fontSize: 20,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 290,
              width: 290,
              child: Image.asset("assets/brand.png"),
            ),
            Column(
              children: <Widget>[
                const Text(
                  "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
               sizedBoxHeight30,

                MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "AGREE AND CONTINUE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
