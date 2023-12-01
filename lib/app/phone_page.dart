import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/app/components/country_picker.dart';
import 'package:pin_auth_patrol/app/components/phone_number_field.dart';
import 'package:pin_auth_patrol/app/controllers/phone_number_input_controller.dart';
import 'package:pin_auth_patrol/app/pin_code_page.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';
import 'package:pin_auth_patrol/common/widgets/button.dart';
import 'package:pin_auth_patrol/common/widgets/loading.dart';
import 'package:pin_auth_patrol/fixture/phone_confirmation_mocks.dart';
import 'package:pin_auth_patrol/services/country_service.dart';
import 'package:pin_auth_patrol/utils/format.dart';

import '../../common/themes/text_styles.dart';
import '../../common/widgets/keypad.dart';
import '../../models/country_model.dart';

class PhonePage extends StatefulWidget {
  final PhoneConfirmationMock phone;
  const PhonePage({Key? key, required this.phone}) : super(key: key);

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  final controller = PhoneNumberInputController();
  final countryService = CountryService();
  List<CountryModel> countries = [];
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  void hideLoading() async {
    setState(() {
      isLoading = false;
    });
  }

  void loadCountries() async {
    countries = await countryService.loadCountries();
    setState(() {});
  }

  void handleKeyPressed(String value) {
    setState(() {
      controller.handleKeyPressed(value);
    });
  }

  void onCountrySelected(CountryModel country) {
    setState(() {
      controller.onCountrySelected(country);
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
                      TextSpan(
                        style: AppTextStyles.bodyText1(
                            color: AppColors.textOnPrimary80),
                        text:
                            'Para confirmar sua identidade, primeiro confirme o  número de telefone selecionado \n',
                      ),
                      TextSpan(
                        text: formatPhoneNumber(widget.phone.phoneNumber),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                PhoneNumberField(
                  controller: controller.phoneController,
                  digitCount: controller.phoneController.text.length,
                  someNumber: controller.selectedCountry.someNumber,
                  countryCode: controller.selectedCountry.dialCode,
                  errorMessage: errorMessage,
                  onCountryCodeTap: () {
                    CountryPicker(
                      context: context,
                      selectedCountry: controller.selectedCountry,
                      countries: countries,
                      onCountrySelected: onCountrySelected,
                    ).showCountryPicker();
                  },
                ),
                const SizedBox(height: 24),
                Button(
                  key: ValueKey("send_code_button"),
                  label: 'Enviar código',
                  isEnabled: buttonEnabled,
                  onPressed: buttonEnabled
                      ? () {
                          String normalizedProvidedNumber =
                              normalizePhoneNumber(widget.phone.phoneNumber);
                          String normalizedEnteredNumber = normalizePhoneNumber(
                              controller.phoneController.text);

                          if (normalizedProvidedNumber !=
                              normalizedEnteredNumber) {
                            setState(() {
                              errorMessage =
                                  "O número digitado não corresponde ao número fornecido.";
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
                                  builder: (context) => PinCodePage(
                                      country: controller.selectedCountry,
                                      phone: widget.phone),
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
