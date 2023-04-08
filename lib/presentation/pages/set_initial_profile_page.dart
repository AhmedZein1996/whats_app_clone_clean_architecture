import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/phone_auth/phone_auth_cuibt.dart';
import '../theme/constants.dart';
import '../theme/style.dart';
import '../widgets/default_button_widget.dart';

class SetInitialProfilePage extends StatefulWidget {
  final String phoneNumber;

  const SetInitialProfilePage({super.key, required this.phoneNumber});

  @override
  _SetInitialProfilePageState createState() => _SetInitialProfilePageState();
}

class _SetInitialProfilePageState extends State<SetInitialProfilePage> {
  String get _phoneNumber => widget.phoneNumber;
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: <Widget>[
            const Text(
              "Profile Info",
              style: TextStyle(
                color: greenColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBoxHeight20,
            const Text(
              "Please provide your name and an optional Profile photo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            sizedBoxHeight30,
            _rowWidget(),
            DefaultButtonWidget(
              onPressed: (){
                _submitProfileInfo();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowWidget() {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: const Icon(Icons.camera_alt),
        ),
        sizedBoxWidth8,
        Expanded(
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: "Enter your name",
            ),
          ),
        ),
        sizedBoxHeight8,
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: const Icon(Icons.insert_emoticon),
        )
      ],
    );
  }

  _submitProfileInfo() {
    if (_nameController.text.isNotEmpty) {
      BlocProvider.of<PhoneAuthCubit>(context).submitProfileInfo(
        name: _nameController.text,
        phoneNumber: _phoneNumber,
        profileUrl: '',
      );
    }
  }
}
