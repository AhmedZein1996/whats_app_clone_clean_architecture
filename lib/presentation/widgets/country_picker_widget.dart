import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

import '../theme/constants.dart';
import '../theme/style.dart';

class CountryPickerWidget extends StatefulWidget {
  final Function countryPickerCallback;

  CountryPickerWidget({required this.countryPickerCallback});

  @override
  _CountryPickerWidgetState createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('92');

  //String _countryCode = '92';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _openFilteredCountryPickerDialog,
      title: _buildDialogItem(_selectedFilteredDialogCountry),
    );
  }

  void _openFilteredCountryPickerDialog() {
    showDialog(
        context: context,
        builder: (_) => Theme(
              data: Theme.of(context).copyWith(
                primaryColor: primaryColor,
              ),
              child: CountryPickerDialog(
                titlePadding: const EdgeInsets.all(8.0),
                searchCursorColor: Colors.black,
                searchInputDecoration: const InputDecoration(
                  hintText: 'Search',
                ),
                isSearchable: true,
                title: const Text('Select your phone code'),
                onValuePicked: (Country country) {
                  //   setState(() {
                  _selectedFilteredDialogCountry = country;
                  //  });
                  widget.countryPickerCallback(
                      _selectedFilteredDialogCountry.phoneCode);
                },
                itemBuilder: _buildDialogItem,
              ),
            ));
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: greenColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          sizedBoxWidth8,
          Text('+${country.phoneCode}'),
          sizedBoxWidth8,
          SizedBox(
            width: 100,
            child: Text(
              country.name,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
