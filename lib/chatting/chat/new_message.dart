import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser; // 현 사용자
    final userData = await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get(); //유저데이정보
    FirebaseFirestore.instance.collection('chat').add({
      'text': _userEnterMessage,
      'time': Timestamp.now(),
      'userID': user.uid,
      'userName': userData.data()!['이름'],
      'userImage': userData['사진']
    });
    _controller.clear();
    setState(() {
      Time();
    });
  }

  void Time() {
    DateFormat.jm().format(
      DateTime.now(),
    );
  } //채팅창 몇시 몇분

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null, //자동 줄바꿈
              controller: _controller,
              decoration: InputDecoration(
                labelText: ('메세지를 전달하세요.'),
              ),
              onChanged: (value) {
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
