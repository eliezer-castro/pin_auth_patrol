import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/country_model.dart';

class CountryService {
  Future<List<CountryModel>> loadCountries() async {
    try {
      final String response =
          await rootBundle.loadString('lib/fixture/countries.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => CountryModel.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }
}
