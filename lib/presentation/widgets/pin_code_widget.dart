import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({super.key});
  static String pinCodeText = '';
  static String getPinCodeText() {
    return pinCodeText;
class PinCodeWidget extends StatefulWidget {
  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  final TextEditingController _pinCodeController = TextEditingController();
  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          PinCodeTextField(
            appContext: context,
            length: 6,
            backgroundColor: Colors.transparent,
            obscureText: true,
            autoDisposeControllers: false,
            onChanged: (value){
              pinCodeText = value;
            },
          ),
          const Text("Enter your 6 digit code")
        ],
      ),
    );
  }
}
