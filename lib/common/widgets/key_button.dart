import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';
import 'package:pin_auth_patrol/common/themes/text_styles.dart';

class KeyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const KeyButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double buttonWidth = constraints.maxWidth / 3;
        return SizedBox(
          width: buttonWidth,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8.0),
            ),
            child: Text(
              label,
              style: AppTextStyles.headline2(color: AppColors.textOnPrimary),
            ),
          ),
        );
      },
    );
  }
}
