import 'package:flutter/material.dart';
import 'package:whatsappclonecleanarch/presentation/pages/phone_varification_page.dart';
import 'package:whatsappclonecleanarch/presentation/theme/constants.dart';
import 'package:whatsappclonecleanarch/presentation/widgets/country_picker_widget.dart';
import 'package:whatsappclonecleanarch/presentation/widgets/app_description_widget.dart';
import 'package:whatsappclonecleanarch/presentation/widgets/default_button_widget.dart';
import 'package:whatsappclonecleanarch/presentation/widgets/user_phone_number_widget.dart';

class RegistrationScreen extends StatefulWidget {

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
   String _countryCode = '92';

   _countryPickerCallback( String countryCode) {
    setState(() {
      _countryCode = countryCode;
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: Column(
            children: <Widget>[
              AppDescriptionWidget(),
              sizedBoxHeight30,
              CountryPickerWidget(countryPickerCallback: _countryPickerCallback),
              UserPhoneNumberWidget(countryCode: _countryCode,),
              DefaultButtonWidget(
                onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PhoneVerificationPage(),
                  ),
                );
              }
              ,),
            ],
          ),
        ));
  }
}
