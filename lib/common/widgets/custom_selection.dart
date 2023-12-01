import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/common/themes/colors.dart';
import 'package:pin_auth_patrol/common/themes/text_styles.dart';

class CustomSelection extends StatefulWidget {
  final bool isSelected;
  final Function(bool) onSelect;
  final String label;
  const CustomSelection(
      {super.key,
      required this.isSelected,
      required this.onSelect,
      required this.label});

  @override
  CustomSelectionState createState() => CustomSelectionState();
}

class CustomSelectionState extends State<CustomSelection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey("phone_item"),
      borderRadius: BorderRadius.circular(6),
      onTap: () {
        widget.onSelect(!widget.isSelected);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.isSelected
              ? const Color(0xFF096DD9).withOpacity(0.2)
              : null,
          border: Border.all(
            color: widget.isSelected
                ? const Color(0xFF096DD9)
                : Colors.grey.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Radio(
              value: widget.isSelected,
              groupValue: widget.isSelected ? true : null,
              onChanged: (bool? value) {
                widget.onSelect(value!);
              },
              activeColor: const Color(0xFF096DD9),
            ),
            Text(
              widget.label,
              style: AppTextStyles.bodyText1(color: AppColors.textOnPrimary),
            )
          ],
        ),
      ),
    );
  }
}
