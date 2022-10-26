import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var language = false;
  var count = 0;
  void increment() {
    count++;
    update();
  }

  changeLanguage(state) {
    if (state == true) {
      language = true;
      Get.updateLocale(const Locale('th', 'THA'));
    } else {
      language = false;
      Get.updateLocale(const Locale('en', 'US'));
    }
    update();
  }
}
