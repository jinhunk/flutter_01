import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';
import 'package:flutter_01/chatting/chat/message.dart';
import 'package:flutter_01/chatting/chat/new_message.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'dart:math' as math;

import 'package:flutter_01/screens/jelly.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedUser;
  UserModel models = UserModel();

  @override // <=재정의 하자는 의미
  void initState() {
    super.initState();
    userInfor();
    // getCurrentUser();
  } //한번 초기화

  // void getCurrentUser() {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       loggedUser = user;
  //       print(loggedUser.email);
  //     }
  //   } catch (e) {
  //     print('에러발생');
  //   }
  // } //현재유저(사용자)

  Future<void> userInfor() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      await firebaseFirestore
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        this.models = UserModel.fromMap(value.data());
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "${models.name}  ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 6.0),
              width: MediaQuery.of(context).size.width / 1.0,
              height: MediaQuery.of(context).size.height / 500.0,
              color: Color.fromARGB(255, 248, 245, 245),
            ),
          ),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     _auth.signOut();
            //     // Navigator.pop(context);
            //   },
            //   icon: Icon(Icons.exit_to_app_sharp),
            // ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Transform.rotate(
                angle: -20 * math.pi / 180,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (Jelly())));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.0),
                    padding: EdgeInsets.only(top: 2.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 235, 229, 229),
                            Colorss.indexColor,
                          ]),
                      color: Colors.pink,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0),
                          topRight: Radius.circular(7.0),
                          bottomLeft: Radius.circular(11.0),
                          bottomRight: Radius.circular(11.0)),
                    ),
                    width: MediaQuery.of(context).size.width / 10.0,
                    child: Text(
                      'Jelly',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Messages(),
              ),
              NewMessage(),
            ],
          ),
        ));
  }
}
