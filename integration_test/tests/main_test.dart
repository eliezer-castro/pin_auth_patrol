import 'package:flutter_test/flutter_test.dart';
import 'package:pin_auth_patrol/fixture/phone_confirmation_mocks.dart';
import 'package:pin_auth_patrol/utils/format.dart';

import '../shared/cammon.dart';
import '../shared/exports.dart';

void main() {
  patrol('Home', ($) async {
    final phoneSelectionPage = PhoneSelectionPageObject($);
    final phonePage = PhonePageObject($);
    final pinCodePage = PinCodePageObject($);

    await createApp($);
    // @ Exibição de Números de Telefone Parcialmente Ocultos
    for (var mock in phoneConfirmationMocks) {
      final formattedNumber = formatPhoneNumber(mock.phoneNumber);
      expect(find.text(formattedNumber), findsOneWidget);
    }
    // @ Seleção de Número de Telefone
    await phoneSelectionPage.selectPhone(4);
    await phoneSelectionPage.tapContinueButton();
    // @ Alteração de País na Tela de Confirmação
    await phonePage.openCountryPicker();
    await phonePage.selectCountry('+55');
    await phonePage.enterPhoneNumber('21945678901');
    // @ Navegação para Tela de Pincode
    await phonePage.tapSendCodeButton();
    // @ Alteração de Número de Telefone na Tela de Pincode
    await pinCodePage.changePhoneNumber();
    await phoneSelectionPage.selectPhone(2);
    await phoneSelectionPage.tapContinueButton();
    await phonePage.openCountryPicker();
    await phonePage.selectCountry('+593');
    await phonePage.enterPhoneNumber('022345678');
    await phonePage.tapSendCodeButton();
    //@ Funcionalidade de Reenviar Código Pincode
    await Future.delayed(const Duration(seconds: 5));
    await pinCodePage.tapResendCodeButton();
    expect(find.textContaining('Solicite um novo código em'), findsOneWidget);
    // @ Confirmação de Pincode
    await pinCodePage.enterPin('816923');
    await pinCodePage.tapConfirmCodeButton();
    // @ Navegação para Tela de Sucesso Após Confirmação do Pincode
    expect(find.text('Seu número foi verificado!'), findsOneWidget);
  });
}
