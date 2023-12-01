import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

String applyMask(String text, String mask) {
  final maskFormatter = MaskTextInputFormatter(mask: mask);
  return maskFormatter.maskText(text);
}

String formatPhoneNumber(String phone) {
  return phone.replaceAllMapped(RegExp(r'\d(?=.*\d{2})'), (match) => '•');
}

String normalizePhoneNumber(String phoneNumber) {
  return phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
}
