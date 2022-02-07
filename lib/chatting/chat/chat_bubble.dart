import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, {Key? key}) : super(key: key);
  final String message;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colorss.indexColor,
            borderRadius: BorderRadius.circular(12),
          ),
          width: MediaQuery.of(context).size.width / 4.0,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
