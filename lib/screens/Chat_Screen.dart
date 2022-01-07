import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';

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
        backgroundColor: Colors.redAccent,
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(
                  'chats/49WhVkayAAqNgx8CB26U/message') // 파이어스토리(컬렉션,문서)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } // 대기중(Waiting)
            final docs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      docs[index]['text'],
                      style: TextStyle(fontSize: 20.0),
                    ),
                  );
                });
          }),
    );
  }
}
