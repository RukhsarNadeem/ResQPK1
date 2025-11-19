import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/images_models.dart';

class OnboardingController extends GetxController {
  var items = <ImagesModels>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadOnboardingData();
  }

  Future<void> loadOnboardingData() async {
    final data = await rootBundle.loadString('assets/firstAidJson/.json');
    final List<dynamic> jsonResult = json.decode(data);
    items.value = jsonResult.map((e) => ImagesModels.fromJson(e)).toList();
  }
}
