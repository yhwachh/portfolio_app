import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio_app/models/my_data_model.dart';


class MyDataController {
  Future<MyDataModel> loadUserData() async {
    final String jsonString = await rootBundle.loadString('data/my_data.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return MyDataModel.fromJson(jsonMap);
  }
}
