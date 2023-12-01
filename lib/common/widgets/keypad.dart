import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/common/widgets/key_button.dart';

class Keypad extends StatelessWidget {
  final Function(String) onKeyPressed;
  final VoidCallback onDelete;
  final VoidCallback onDeleteAll;

  const Keypad({
    Key? key,
    required this.onKeyPressed,
    required this.onDelete,
    required this.onDeleteAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 700 ? 4 : 3;
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: crossAxisCount,
            childAspectRatio: (1 / .7),
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(12, (index) {
              if (index == 9) {
                return const SizedBox.shrink();
              } else if (index == 10) {
                return KeyButton(
                  key: ValueKey('keypad_digit_0'),
                  label: '0',
                  onPressed: () => onKeyPressed('0'),
                );
              } else if (index == 11) {
                return GestureDetector(
                  onLongPress: onDeleteAll,
                  child: KeyButton(
                    key: ValueKey('delete_button'),
                    label: '⌫',
                    onPressed: onDelete,
                  ),
                );
              } else {
                return KeyButton(
                  key: ValueKey('keypad_digit_${index + 1}'),
                  label: '${index + 1}',
                  onPressed: () => onKeyPressed('${index + 1}'),
                );
              }
            }),
          ),
        );
      },
    );
  }
}
