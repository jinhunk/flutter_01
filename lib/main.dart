import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/%20Procedure/procedure2.dart';
import 'package:flutter_01/%20Procedure/procedure3.dart';

import 'package:flutter_01/screens/Chat_Screen.dart';
import 'package:flutter_01/screens/OpenPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 파이어베이스(초기화)
  await Firebase.initializeApp(); // 파이어베이스연동할떄 꼭 필요한 코드
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '플러터 기초 연습',
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.white),
      home: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Procedure2();
          } else {
            return OpenPage();
          }
        },
        stream: FirebaseAuth.instance.authStateChanges(),
      ),
    );
  } // 스냅샷(스트림값)이 있으면 내가 원하는 페이지 이동 아니면 로그인페이지이동
}
