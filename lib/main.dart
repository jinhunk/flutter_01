import 'package:flutter/material.dart';
import 'package:flutter_01/screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '플러터 기초 연습',
        theme:
            ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.white),
        home: HomePage());
  }
}
