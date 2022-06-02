import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/chatting/chat/chat_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('time', descending: true) // 채팅내용이 밑에서부터 나오게 정렬
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = snapshot.data!.docs;
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListView.builder(
            reverse: true, // 채팅내용이 밑에서 부터 나오는 동작
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              return ChatBubbles(
                chatDocs[index]['text'],
                chatDocs[index]['userID'].toString() == user!.uid,
                chatDocs[index]['userName'].toString(),
              );
            },
          ),
        );
      },
    );
  }
}
