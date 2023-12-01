import 'package:flutter/material.dart';
import 'package:pin_auth_patrol/models/country_model.dart';

import '../../../common/themes/text_styles.dart';

class CountryPicker {
  final BuildContext context;
  CountryModel selectedCountry;
  final List<CountryModel> countries;
  final void Function(CountryModel) onCountrySelected;

  CountryPicker({
    required this.context,
    required this.selectedCountry,
    required this.countries,
    required this.onCountrySelected,
  });

  void showCountryPicker() {
    showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 22, 20, 39),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (BuildContext context, int index) {
                final country = countries[index];
                print('country_picker_item_${country.dialCode}');
                return ListTile(
                  key: Key('country_picker_item_${country.dialCode}'),
                  title: Text("${country.name} (${country.dialCode})",
                      style: AppTextStyles.bodyText1()),
                  onTap: () {
                    onCountrySelected(country);
                    Navigator.pop(context);
                  },
                  trailing: country.dialCode == selectedCountry.dialCode
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
