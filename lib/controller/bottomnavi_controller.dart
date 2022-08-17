import 'package:flutter/material.dart';

import 'package:get/get.dart';

enum PageName { HOME, STOTEY, PICK, CHAT, PROFILE }

class BottomnaviController extends GetxController {
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> searchPageNaviationkey =
      GlobalKey<NavigatorState>();

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
      case PageName.STOTEY:
      case PageName.PICK:
      case PageName.CHAT:
      case PageName.PROFILE:
        changePage(value);
        break;
    }
  }

  void changePage(int value) {
    pageIndex(value);
  }
}
