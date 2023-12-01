import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/models/country_model.dart';

class PhoneNumberInputController {
  final TextEditingController phoneController = TextEditingController();
  CountryModel selectedCountry = CountryModel(
    name: "Argentina",
    dialCode: "+54",
    someNumber: 10,
    format: "### ###-####",
  );

  bool isButtonEnabled() {
    return phoneController.text.length == selectedCountry.someNumber;
  }

  void handleKeyPressed(String value) {
    if (phoneController.text.length < selectedCountry.someNumber) {
      phoneController.text += value;
    }
  }

  void handleDelete() {
    if (phoneController.text.isNotEmpty) {
      phoneController.text =
          phoneController.text.substring(0, phoneController.text.length - 1);
    }
  }

  void handleDeleteAll() {
    phoneController.clear();
  }

  void onCountrySelected(CountryModel country) {
    selectedCountry = country;
    if (phoneController.text.length > country.someNumber) {
      phoneController.text =
          phoneController.text.substring(0, country.someNumber);
    }
  }
}
