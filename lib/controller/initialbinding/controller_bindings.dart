import 'package:get/instance_manager.dart';
// import 'package:testgetx/controller/api_base_service.dart';

import 'api_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
    // Get.put<ServiceRequest>(ServiceRequest());
  }
}
