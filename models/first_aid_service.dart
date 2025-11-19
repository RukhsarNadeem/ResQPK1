import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/first_aid_model.dart';

class FirstAidService {
  static Future<FirstAidModel> loadCategory(String categoryId) async {
    String jsonString = await rootBundle.loadString("assets/firstAidJson/$categoryId.json");

    final data = json.decode(jsonString);
    return FirstAidModel.fromJson(data);
  }
}
