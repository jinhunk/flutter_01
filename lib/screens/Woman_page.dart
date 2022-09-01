import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/controller/bottomnavi_controller.dart';
import 'package:flutter_01/screens/Chat_Screen.dart';
import 'package:flutter_01/screens/Onboarding.dart';
import 'package:flutter_01/screens/StoreyW2.dart';

import 'package:flutter_01/screens/Woman/StoreyW.dart';

import 'package:flutter_01/screens/Woman/HomeW.dart';
import 'package:flutter_01/screens/Woman/ProfileW.dart';
import 'dart:math' as math;

import 'package:flutter_01/screens/Woman/pick.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WomanPage extends GetView<BottomnaviController> {
  const WomanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(index: controller.pageIndex.value, children: [
          const HomeW(),
          Navigator(
            key: controller.searchPageNaviationkey,
            onGenerateRoute: (routeSettings) {
              return MaterialPageRoute(
                builder: (context) => const StoreyW(),
              );
            },
          ),
          const Pick(),
          const ChatScreen(),
          const ProfileW(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colorss.indexColor,
          unselectedItemColor: Colors.grey,
          // unselectedItemColor: Colors.black26,
          onTap: controller.changeBottomNav,
          currentIndex: controller.pageIndex.value,
          items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "소개",
                backgroundColor: Colors.white),
            new BottomNavigationBarItem(
                icon: Icon(Icons.connect_without_contact),
                label: "스토리",
                backgroundColor: Colors.white),
            new BottomNavigationBarItem(
                icon: const Icon(Icons.collections),
                label: "위픽",
                backgroundColor: Colors.white),
            new BottomNavigationBarItem(
                icon: const Icon(Icons.chat),
                label: "채팅",
                backgroundColor: Colors.white),
            new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "프로필",
                backgroundColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
