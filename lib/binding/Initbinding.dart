import 'package:flutter_01/controller/bottomnavi_controller.dart';

import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomnaviController(), permanent: true);
  }
}
