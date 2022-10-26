import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:testgetx/controller/home/counter_controller.dart';
import 'package:testgetx/controller/home/language_controller.dart';
import 'package:testgetx/theme/theme_controller.dart';
import 'package:testgetx/screen/page2_screen.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final CounterController controller = Get.put(CounterController());
  final ThemeController themecontroller = Get.put(ThemeController());
  final LanguageController languagecontroller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(titlecontroller.titlename1),
        title: Text('page1'.tr),
        // title: Text('Get Storage Example:' + (data.read('example') ?? 'n/a')),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() {
                  return const Page2();
                });
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'text1'.tr,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              return Text(
                // controller.counter.toString(),
                controller.counterText.string,
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            // Center(
            //   child: IconButton(
            //       onPressed: () {
            //         Get.isDarkMode
            //             ? Get.changeTheme(ThemeData.light())
            //             : Get.changeTheme(ThemeData.dark());
            const SizedBox(
              height: 20,
            ),
            Switch(
                value: themecontroller.isDark,
                onChanged: (state) {
                  themecontroller.changeTheme(state);
                }),
            const SizedBox(
              height: 20,
            ),
            Switch(
                value: languagecontroller.language,
                onChanged: (state) {
                  languagecontroller.changeLanguage(state);
                }),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementCounter();
        },
        // onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
