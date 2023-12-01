import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/app/Success_page.dart';
import 'package:pin_auth_patrol/app/components/code_number_field.dart';
import 'package:pin_auth_patrol/app/controllers/code_number_input_controller.dart';
import 'package:pin_auth_patrol/app/phone_selection_page.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';
import 'package:pin_auth_patrol/common/widgets/button.dart';
import 'package:pin_auth_patrol/common/widgets/keypad.dart';
import 'package:pin_auth_patrol/common/widgets/loading.dart';
import 'package:pin_auth_patrol/fixture/phone_confirmation_mocks.dart';
import 'package:pin_auth_patrol/models/country_model.dart';
import 'package:pin_auth_patrol/utils/format.dart';

import '../../common/themes/text_styles.dart';

class PinCodePage extends StatefulWidget {
  final CountryModel country;
  final PhoneConfirmationMock phone;
  const PinCodePage({Key? key, required this.country, required this.phone})
      : super(key: key);

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  final controller = CodeNumberInputController();
  String formattedPhoneNumber = "";
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    formattedPhoneNumber =
        applyMask(widget.phone.phoneNumber, widget.country.format);
  }

  void handleKeyPressed(String value) {
    setState(() {
      controller.handleKeyPressed(value);
    });
  }

  void handleDelete() {
    setState(() {
      controller.handleDelete();
    });
  }

  void handleDeleteAll() {
    setState(() {
      controller.handleDeleteAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool buttonEnabled = controller.isButtonEnabled();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Digite seu número de celular',
                  style:
                      AppTextStyles.headline2(color: AppColors.textOnPrimary),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodyText1(
                        color: AppColors
                            .textOnPrimary80), // Estilo base para o texto
                    children: [
                      const TextSpan(
                        text: 'Enviamos um código de confirmação para \n',
                      ),
                      TextSpan(
                        text:
                            '${widget.country.dialCode} $formattedPhoneNumber ',
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: TextButton(
                          key: ValueKey('change_phone_number_button'),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PhoneSelectionPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Alterar número',
                            style: AppTextStyles.bodyText2(
                              color: const Color.fromARGB(255, 53, 146, 252),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                CodeNumberField(
                  controller: controller.codeController,
                  digitCount: controller.codeController.text.length,
                  someNumber: 6,
                  errorMessage: errorMessage,
                ),
                const SizedBox(height: 32),
                Button(
                  key: ValueKey('confirm_code_button'),
                  label: 'Enviar código',
                  isEnabled: buttonEnabled,
                  onPressed: buttonEnabled
                      ? () {
                          if (controller.codeController.text !=
                              widget.phone.confirmationCode) {
                            setState(() {
                              errorMessage = "Código digitado incorreto.";
                            });
                          } else {
                            setState(() {
                              errorMessage = null;
                              isLoading = true;
                            });

                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                isLoading = false;
                              });

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SuccessPage(),
                                ),
                              );
                            });
                          }
                        }
                      : null,
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Keypad(
                      onKeyPressed: handleKeyPressed,
                      onDelete: handleDelete,
                      onDeleteAll: handleDeleteAll,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isLoading)
            const Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: ModalBarrier(
                  dismissible: false,
                  color: AppColors.background,
                ),
              ),
            ),
          if (isLoading) const Center(child: LoadingWidget()),
        ],
      ),
    );
  }
}
