import 'package:flutter/material.dart';
import 'package:whatsappclonecleanarch/presentation/pages/set_initial_profile_page.dart';
import 'package:whatsappclonecleanarch/presentation/widgets/app_description_widget.dart';
import 'package:whatsappclonecleanarch/presentation/widgets/default_button_widget.dart';
import 'package:whatsappclonecleanarch/presentation/widgets/pin_code_widget.dart';

class PhoneVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: Column(
          children: [
            AppDescriptionWidget(),
            PinCodeWidget(),
            DefaultButtonWidget(
              onPressed: (){
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SetInitialProfileWidget(),
                      ),
                    );},
            ),
          ],
        ),
      ),
    );
  }
}
