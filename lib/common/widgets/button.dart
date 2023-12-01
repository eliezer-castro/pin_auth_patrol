import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/common/themes/text_styles.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const Button({
    Key? key,
    required this.label,
    this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor:
            isEnabled ? AppColors.primary : Colors.grey.withOpacity(0.38),
        disabledForegroundColor:
            !isEnabled ? Colors.grey.withOpacity(0.38) : null,
        disabledBackgroundColor:
            !isEnabled ? Colors.grey.withOpacity(0.12) : null,
        // Cor desabilitada
      ),
      child: Text(
        label,
        style: AppTextStyles.button(
            color: isEnabled
                ? AppColors.textOnPrimary
                : Colors.grey.withOpacity(0.88)),
      ),
    );
  }
}
