import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class titleController extends GetxController {
  var titlename1 = "PAGE1";
  var titlename2 = "PAGE2";
}

class NavigateController extends GetxController {
  navigate_2() => Get.toNamed('/Page2');
}

