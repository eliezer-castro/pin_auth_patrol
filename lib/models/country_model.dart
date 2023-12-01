class CountryModel {
  String name;
  String dialCode;
  int someNumber;
  String format;

  CountryModel(
      {required this.name,
      required this.dialCode,
      required this.someNumber,
      required this.format});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] as String,
      dialCode: json['dialCode'] as String,
      someNumber: json['someNumber'] as int,
      format: json['format'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dialCode': dialCode,
      'someNumber': someNumber,
      'format': format,
    };
  }
}
