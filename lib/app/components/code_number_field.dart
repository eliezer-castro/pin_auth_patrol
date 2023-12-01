import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_auth_patrol/app/components/resend_code.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';
import 'package:pin_auth_patrol/common/themes/text_styles.dart';

class CodeNumberField extends StatefulWidget {
  final TextEditingController? controller;
  final int digitCount;
  final int someNumber;
  final String? errorMessage;

  const CodeNumberField({
    Key? key,
    this.controller,
    this.digitCount = 0,
    required this.someNumber,
    this.errorMessage,
  }) : super(key: key);

  @override
  State<CodeNumberField> createState() => _CodeNumberFieldState();
}

class _CodeNumberFieldState extends State<CodeNumberField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Código',
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
            Expanded(
              child: TextField(
                keyboardType: TextInputType.none,
                maxLength: widget.someNumber,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                controller: widget.controller,
                style: const TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
                decoration: const InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  hintText: '000000',
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
        const ResendCode(),
      ],
    );
  }
}
