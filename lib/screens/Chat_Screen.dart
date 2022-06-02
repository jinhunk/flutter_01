import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';
import 'package:flutter_01/chatting/chat/message.dart';
import 'package:flutter_01/chatting/chat/new_message.dart';
import 'package:flutter_01/confing/Colors.dart';

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
        appBar: AppBar(
          backgroundColor: Colorss.indexColor,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${models.name}  ",
                  style: TextStyle(color: Colors.black54, fontSize: 14.0)),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                _auth.signOut();
                // Navigator.pop(context);
              },
              icon: Icon(Icons.exit_to_app_sharp),
            )
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
