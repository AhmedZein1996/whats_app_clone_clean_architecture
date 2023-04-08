import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_clone_clean_architecture/presentation/bloc/auth/auth_cuibt.dart';
import 'package:whats_app_clone_clean_architecture/presentation/bloc/auth/auth_state.dart';
import 'package:whats_app_clone_clean_architecture/presentation/bloc/phone_auth/phone_auth_cuibt.dart';
import 'package:whats_app_clone_clean_architecture/presentation/bloc/phone_auth/phone_auth_state.dart';
import 'package:whats_app_clone_clean_architecture/presentation/pages/set_initial_profile_page.dart';
import 'package:whats_app_clone_clean_architecture/presentation/screens/home_screen.dart';

import '../pages/phone_varification_page.dart';
import '../theme/constants.dart';
import '../widgets/app_description_widget.dart';
import '../widgets/country_picker_widget.dart';
import '../widgets/default_button_widget.dart';
import '../widgets/user_phone_number_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen
  ({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _countryCode = '92';
   String _phoneNumber = '';

  _countryPickerCallback(String countryCode) {
    setState(() {
      _countryCode = countryCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
        builder: (context, phoneAuthState) {
          if (phoneAuthState is PhoneAuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (phoneAuthState is PhoneAuthSmsCodeReceived) {
            return PhoneVerificationPage(
              phoneNumber: _phoneNumber,
            );
          }
          if (phoneAuthState is PhoneAuthProfileInfo) {
            return  SetInitialProfilePage(
              phoneNumber: _phoneNumber,
            );
          }
          if (phoneAuthState is PhoneAuthSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomeScreen(uid: authState.uid,);
                }
                return Container();
              },);
          }
          return _buildBody();
        },
        listener: (context, phoneAuthState) {
          if (phoneAuthState is PhoneAuthSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (phoneAuthState is PhoneAuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Somthing is wrong.'),
                      Icon(Icons.error_outline, color: Colors.white,),
                    ],
                  ),
                ),),);
          }
        },),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      child: Column(
        children: <Widget>[
          const AppDescriptionWidget(),
          sizedBoxHeight30,
          CountryPickerWidget(countryPickerCallback: _countryPickerCallback),
          UserPhoneNumberWidget(
            countryCode: _countryCode,
          ),
          DefaultButtonWidget(
            onPressed: (){
              _submitVerificationPhoneNumber();
            },
          ),
        ],
      ),
    );
  }

   _submitVerificationPhoneNumber() {
     final String phoneText =  UserPhoneNumberWidget.getPhoneText();
     log('phone number is : $phoneText');
    if (phoneText.isNotEmpty){
      _phoneNumber = '+$_countryCode$phoneText';
      log('phone number isNotEmpty ');
      BlocProvider.of<PhoneAuthCubit>(context).submitVerifyPhoneNumber(_phoneNumber);
    }
  }

}
