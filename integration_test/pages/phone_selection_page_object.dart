import 'package:patrol/patrol.dart';

class PhoneSelectionPageObject {
  final PatrolIntegrationTester $;

  PhoneSelectionPageObject(this.$);

  Future<void> selectPhone(int index) async {
    await $(#phone_item).at(index).tap();
  }

  Future<void> tapContinueButton() async {
    await $(#continue_button).tap();
  }
}
