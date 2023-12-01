import 'package:patrol/patrol.dart';

class PinCodePageObject {
  final PatrolIntegrationTester $;

  PinCodePageObject(this.$);

  Future<void> enterPin(String number) async {
    for (var digit in number.split('')) {
      Symbol key = Symbol("keypad_digit_$digit");
      await $(key).tap();
    }
  }

  Future<void> deleteLastDigit() async {
    await $(#delete_button).tap();
  }

  ///TODO Não utlizar o método, pois ele ainda não está implementado
  Future<void> deleteAllPhoneNumber() async {
    await $(#delete_button);
  }

  Future<void> tapConfirmCodeButton() async {
    await $(#confirm_code_button).tap();
  }

  Future<void> changePhoneNumber() async {
    await $(#change_phone_number_button).tap();
  }

  Future<void> tapResendCodeButton() async {
    await $(#resend_code).tap();
  }
}
