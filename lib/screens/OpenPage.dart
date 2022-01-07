import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/LoginPage.dart';
import 'package:flutter_01/screens/PhonePage.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  _OpenPageState createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.15,
              height: MediaQuery.of(context).size.height / 19.0,
              child: TextButton.icon(
                  style:
                      TextButton.styleFrom(backgroundColor: Colorss.indexColor),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhonePage()));
                  },
                  icon: Icon(
                    Icons.phone,
                    size: 15.0,
                    color: Colors.white,
                  ),
                  label: const Text(
                    '전화번호로 계속하기',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text(
                  '이메일로 로그인',
                  style: TextStyle(color: Colors.black, fontSize: 12.0),
                ))
          ],
        ),
      ),
    );
  }
}
