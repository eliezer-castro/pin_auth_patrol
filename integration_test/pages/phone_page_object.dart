import 'package:patrol/patrol.dart';

class PhonePageObject {
  final PatrolIntegrationTester $;

  PhonePageObject(this.$);

  Future<void> enterPhoneNumber(String number) async {
    for (var digit in number.split('')) {
      Symbol key = Symbol("keypad_digit_$digit");
      await $(key).scrollTo().tap();
    }
  }

  Future<void> deletePhoneNumber() async {
    await $(#delete_button).tap();
  }

  ///TODO Não utlizar o método, pois ele ainda não está implementado
  Future<void> deleteAllPhoneNumber() async {
    await $(#delete_button);
  }

  Future<void> tapSendCodeButton() async {
    await $(#send_code_button).scrollTo().tap();
  }

  Future<void> openCountryPicker() async {
    await $(#country_code_field).tap();
  }

  Future<void> selectCountry(String dialCode) async {
    Symbol key = Symbol("country_picker_item_${dialCode}");
    await $(key).scrollTo().tap();
  }
}
