import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/models/country_model.dart';

class CodeNumberInputController {
  final TextEditingController codeController = TextEditingController();

  bool isButtonEnabled() {
    return codeController.text.length == 6;
  }

  void handleKeyPressed(String value) {
    if (codeController.text.length < 6) {
      codeController.text += value;
    }
  }

  void handleDelete() {
    if (codeController.text.isNotEmpty) {
      codeController.text =
          codeController.text.substring(0, codeController.text.length - 1);
    }
  }

  void handleDeleteAll() {
    codeController.clear();
  }

  void onCountrySelected(CountryModel country) {
    if (codeController.text.length > 4) {
      codeController.text = codeController.text.substring(0, 6);
    }
  }
}
