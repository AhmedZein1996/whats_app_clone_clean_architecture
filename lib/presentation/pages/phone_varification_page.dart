import 'package:flutter/material.dart';
import 'package:whats_app_clone_clean_architecture/presentation/pages/set_initial_profile_page.dart';

import '../widgets/app_description_widget.dart';
import '../widgets/default_button_widget.dart';
import '../widgets/pin_code_widget.dart';

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
