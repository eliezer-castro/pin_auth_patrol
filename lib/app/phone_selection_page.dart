import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/app/phone_page.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';
import 'package:pin_auth_patrol/common/widgets/button.dart';
import 'package:pin_auth_patrol/common/widgets/custom_selection.dart';
import 'package:pin_auth_patrol/fixture/phone_confirmation_mocks.dart';
import 'package:pin_auth_patrol/utils/format.dart';

import '../../common/themes/text_styles.dart';

class PhoneSelectionPage extends StatefulWidget {
  const PhoneSelectionPage({super.key});

  @override
  State<PhoneSelectionPage> createState() => _PhoneSelectionPageState();
}

class _PhoneSelectionPageState extends State<PhoneSelectionPage> {
  int? _selectedPhoneIndex;

  void _handleSelection(int index) {
    setState(() {
      if (_selectedPhoneIndex == index) {
        _selectedPhoneIndex = null;
      } else {
        _selectedPhoneIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Recuperação de conta',
              style: AppTextStyles.headline2(),
            ),
            Text(
              'Confirme o número de telefone fornecido nas configurações do seu perfil',
              style: AppTextStyles.bodyText1(color: AppColors.textOnPrimary80),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: phoneConfirmationMocks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomSelection(
                      isSelected: _selectedPhoneIndex == index,
                      onSelect: (isSelected) {
                        if (isSelected) {
                          _handleSelection(index);
                        }
                      },
                      label: formatPhoneNumber(
                          phoneConfirmationMocks[index].phoneNumber),
                    ),
                  );
                },
              ),
            ),
            Button(
              key: ValueKey("continue_button"),
              label: 'Continuar',
              isEnabled: _selectedPhoneIndex != null,
              onPressed: _selectedPhoneIndex != null
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PhonePage(
                            phone: phoneConfirmationMocks[_selectedPhoneIndex!],
                          ),
                        ),
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
