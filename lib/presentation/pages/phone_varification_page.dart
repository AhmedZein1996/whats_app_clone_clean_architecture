import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/phone_auth/phone_auth_cuibt.dart';
import '../widgets/app_description_widget.dart';
import '../widgets/default_button_widget.dart';
import '../widgets/pin_code_widget.dart';

class PhoneVerificationPage extends StatelessWidget {

  final String phoneNumber;

  PhoneVerificationPage({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: Column(
          children: [
            const AppDescriptionWidget(),
            const PinCodeWidget(
            ),
            DefaultButtonWidget(
              onPressed:(){
                _submitSmsCode(context);
              }
            ),
          ],
        ),
      ),
    );
  }
  _submitSmsCode(BuildContext context) {
    final String pinCode = PinCodeWidget.getPinCodeText();
    if (pinCode.isNotEmpty) {
      BlocProvider.of<PhoneAuthCubit>(context).submitSmsCode(pinCode);
    }
  }

}
