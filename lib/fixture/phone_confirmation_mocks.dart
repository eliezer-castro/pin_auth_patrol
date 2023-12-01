class PhoneConfirmationMock {
  final String phoneNumber;
  final String confirmationCode;

  PhoneConfirmationMock(
      {required this.phoneNumber, required this.confirmationCode});
}

List<PhoneConfirmationMock> phoneConfirmationMocks = [
  // Paraguai
  PhoneConfirmationMock(
    phoneNumber: "(21) 123-4567",
    confirmationCode: "722869",
  ),
  //Argentina
  PhoneConfirmationMock(
    phoneNumber: "(11) 2345-6789",
    confirmationCode: "483899",
  ),
  //Equador
  PhoneConfirmationMock(
    phoneNumber: "(02) 234-5678",
    confirmationCode: "816923",
  ),
  //Brasil
  PhoneConfirmationMock(
    phoneNumber: "(11) 93456-7890",
    confirmationCode: "627064",
  ),
  //Brasil
  PhoneConfirmationMock(
    phoneNumber: "(21) 94567-8901",
    confirmationCode: "540890",
  ),
];
