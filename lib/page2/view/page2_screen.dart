import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetx/controller/controller.dart';
import 'package:testgetx/page1/controller/page1_controller.dart';

import '../../controller/api_controller.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final CounterController controller = Get.put(CounterController());
  final titleController titlecontroller = Get.put(titleController());
  final apicontroller = Get.find<Controller>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Text(titlecontroller.titlename2),
        //   actions: [IconButton(onPressed:() {
        //     Get.back ();
        //     controller.resetZero();
        //   },
        //   icon: const Icon(Icons.navigate_next)
        //   )],
        // ),
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
              onPressed: (() {
                Get.back();
                controller.resetZero();
              })),
          // title: Text(titlecontroller.titlename2),
          title: Text('page2'.tr),
          centerTitle: true,
        ),
        body: Obx(
          () => apicontroller.isLoading.value
              ? const CircularProgressIndicator()
              : Center(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'data1'.tr,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              ' : ${apicontroller.photoList[0].title}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'data2'.tr,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              ' : ${apicontroller.photoList[0].id}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'data3'.tr,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              ' : ${apicontroller.photoList[0].userId}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'data4'.tr,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              ' : ${apicontroller.photoList[0].completed}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
