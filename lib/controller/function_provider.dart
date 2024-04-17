import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_random_year_api_app/model/data_model.dart';
import 'package:http/http.dart' as http;

class FunctionProvider extends ChangeNotifier {
  Future<DataModel> fetchDataFromAPI() async {
    final response =
        await http.get(Uri.parse('http://numbersapi.com/random/year?json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return DataModel.fromJson(json);
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}
