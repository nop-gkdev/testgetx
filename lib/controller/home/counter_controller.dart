import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  int counter = 0;
  incrementCounter() {
    counter++;
    update();
  }

  resetZero() {
    // ignore: unrelated_type_equality_checks
    if (counter == 5) {
      Get.snackbar(
        "Test Snackbar",
        "Snackbar $counter",
        colorText: Colors.white,
        backgroundColor: const Color.fromARGB(255, 4, 31, 54),
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "สำเร็จ!!",
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      Get.snackbar(
        "Test Snackbar",
        "Snackbar $counter",
        colorText: Colors.white,
        backgroundColor: const Color.fromARGB(255, 250, 41, 41),
        snackPosition: SnackPosition.TOP,
        titleText: const Text(
          "ไม่ใช่ 5!!",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    counter = 0;
    update();
  }
}
