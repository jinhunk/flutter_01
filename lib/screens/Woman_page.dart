import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/Chat_Screen.dart';
import 'package:flutter_01/screens/Woman/StoreyW.dart';

import 'package:flutter_01/screens/Woman/HomeW.dart';
import 'package:flutter_01/screens/Woman/ProfileW.dart';
import 'dart:math' as math;

class WomanPage extends StatefulWidget {
  const WomanPage({Key? key}) : super(key: key);

  @override
  _WomanPageState createState() => _WomanPageState();
}

class _WomanPageState extends State<WomanPage> {
  @override
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [HomeW(), StoreyW(), ChatScreen(), ProfileW()];
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colorss.indexColor,
        unselectedItemColor: Colors.grey,
        // unselectedItemColor: Colors.black26,
        onTap: _onTap,
        currentIndex: _currentIndex,
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
              icon: const Icon(Icons.chat),
              label: "채팅",
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "프로필",
              backgroundColor: Colors.white)
        ],
      ),
    );
  }
}
