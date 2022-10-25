import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:testgetx/page1/view/page1_screen.dart';
import 'controller/controller_bindings.dart';
import 'translation/translation.dart';

Future<void> main() async {
  // await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      translations: Translation(),
      // title: ('hello'.tr),
      theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 4, 31, 54)),
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 4, 31, 54)),
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
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const Page1(),
      initialBinding: ControllerBindings(),
    );
  }
}
