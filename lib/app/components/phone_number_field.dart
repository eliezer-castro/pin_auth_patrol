import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';
import 'package:pin_auth_patrol/common/themes/text_styles.dart';

class PhoneNumberField extends StatefulWidget {
  final VoidCallback? onCountryCodeTap;
  final TextEditingController? controller;
  final int digitCount;
  final String countryCode;
  final int someNumber;
  final String? errorMessage;

  const PhoneNumberField({
    Key? key,
    this.onCountryCodeTap,
    this.controller,
    this.digitCount = 0,
    required this.countryCode,
    required this.someNumber,
    this.errorMessage,
  }) : super(key: key);

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Telefone',
              style: AppTextStyles.caption(color: AppColors.textOnPrimary80),
            ),
            Row(
              children: [
                widget.digitCount == widget.someNumber
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 16,
                      )
                    : Container(),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${widget.digitCount} / ${widget.someNumber}',
                  style:
                      AppTextStyles.caption(color: AppColors.textOnPrimary80),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            TextButton(
              key: ValueKey("country_code_field"),
              onPressed: widget.onCountryCodeTap ?? () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                foregroundColor: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.countryCode,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
                  ),
                  const Icon(Icons.expand_more,
                      color: Colors.white), // Arrow icon
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                key: ValueKey('phone_number_field'),
                keyboardType: TextInputType.none,
                maxLength: widget.someNumber,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: widget.controller,
                style: const TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
                decoration: const InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  hintText: 'Digite seu número de celular',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        if (widget.errorMessage != null)
          Text(
            widget.errorMessage!,
            style: AppTextStyles.bodyText2(color: Colors.red),
          ),
      ],
    );
  }
}
