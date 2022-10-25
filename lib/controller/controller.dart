import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class titleController extends GetxController {
  var titlename1 = "PAGE1";
  var titlename2 = "PAGE2";
}

class NavigateController extends GetxController {
  navigate2() => Get.toNamed('/Page2');
}

class ThemeController extends GetxController {
  var isDark = false;
  var count = 0;
  void increment() {
    count++;
    update();
  }

  changeTheme(state) {
    if (state == true) {
      isDark = true;
      Get.changeTheme(
        ThemeData(
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.grey),
            iconTheme: const IconThemeData(color: Colors.grey),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.grey),
            switchTheme: SwitchThemeData(
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return Colors.grey;
              }),
              trackColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.black;
                }
                return Colors.black;
              }),
            ),
            primaryColor: Colors.grey,
            buttonTheme: const ButtonThemeData(
              buttonColor: Colors.grey,
              disabledColor: Colors.grey,
            )),
      );
    } else {
      isDark = false;
      // Get.changeTheme(ThemeData.light());
      Get.changeTheme(
        ThemeData(
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 4, 31, 54)),
            iconTheme:
                const IconThemeData(color: Color.fromARGB(255, 4, 31, 54)),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromARGB(255, 4, 31, 54),
            ),
            switchTheme: SwitchThemeData(
              thumbColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const Color.fromARGB(255, 4, 31, 54);
                }
                return const Color.fromARGB(255, 4, 31, 54);
              }),
            ),
            primaryColor: const Color.fromARGB(255, 4, 31, 54),
            buttonTheme: const ButtonThemeData(
              buttonColor: Color.fromARGB(255, 4, 31, 54),
              disabledColor: Color.fromARGB(255, 4, 31, 54),
            )),
      );
    }
    update();
  }
}

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
