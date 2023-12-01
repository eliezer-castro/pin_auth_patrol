import 'package:patrol/patrol.dart';

class SuccessPageObject {
  final PatrolIntegrationTester $;

  SuccessPageObject(this.$);

  Future<void> tapBackToStartButton() async {
    await $(#back_to_start_button).tap();
  }
}
