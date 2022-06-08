import 'package:get/get_state_manager/get_state_manager.dart';

class Controller extends GetxController {
  int _x = 0;
  int get x => _x;

  void increment() {
    _x++;
    update();
  }
}
