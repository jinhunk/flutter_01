import 'package:flutter_01/GetX/model.dart';
import 'package:get/get.dart';

class Controller2 extends GetxController {
  final person = Person().obs; // observable

  void updateInfo() {
    person.update((val) {
      val?.age--;
      val?.name = 'jin';
      val?.gender = '남';
    });
  }
}
