import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';

import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';

class ChatBubbles extends StatefulWidget {
  const ChatBubbles(this.message, this.isMe, this.userName, {Key? key})
      : super(key: key);
  final String message;
  final String userName;
  final bool isMe;

  @override
  State<ChatBubbles> createState() => _ChatBubblesState();
}

class _ChatBubblesState extends State<ChatBubbles> {
  @override
  void initState() {
    super.initState();
    userdata();
  }

  UserModel models = UserModel();

  Future<void> userdata() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      this.models = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 40.0),
            //   child: Text(
            //     DateFormat.jm().format(
            //       DateTime.now(),
            //     ),
            //     style: TextStyle(fontSize: 10.0),
            //   ),
            // ),
            if (widget.isMe)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 45, 0),
                child: ChatBubble(
                  clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 20),
                  backGroundColor: Colors.blue,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Column(
                      crossAxisAlignment: widget.isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          widget.message,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (!widget.isMe)
              Padding(
                padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
                child: ChatBubble(
                  clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
                  backGroundColor: Color(0xffE7E7ED),
                  margin: EdgeInsets.only(top: 20),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Column(
                      crossAxisAlignment: widget.isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          widget.message,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
        Positioned(
          top: 0,
          right: widget.isMe ? 5 : null,
          left: widget.isMe ? null : 5,
          child: CircleAvatar(
            backgroundImage: NetworkImage("${models.imageURL} "),
          ),
        ),
      ],
    );
    // : Stack(
    //     children: [
    //       Row(
    //         mainAxisAlignment: widget.isMe
    //             ? MainAxisAlignment.end
    //             : MainAxisAlignment.start,
    //         children: [
    //           if (widget.isMe)
    //             Padding(
    //               padding: const EdgeInsets.fromLTRB(0, 10, 45, 0),
    //               child: ChatBubble(
    //                 clipper:
    //                     ChatBubbleClipper8(type: BubbleType.sendBubble),
    //                 alignment: Alignment.topRight,
    //                 margin: EdgeInsets.only(top: 20),
    //                 backGroundColor: Colors.blue,
    //                 child: Container(
    //                   constraints: BoxConstraints(
    //                     maxWidth: MediaQuery.of(context).size.width * 0.7,
    //                   ),
    //                   child: Column(
    //                     crossAxisAlignment: widget.isMe
    //                         ? CrossAxisAlignment.end
    //                         : CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         widget.userName,
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.white),
    //                       ),
    //                       SizedBox(height: 20.0),
    //                       Text(
    //                         widget.message,
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           if (!widget.isMe)
    //             Padding(
    //               padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
    //               child: ChatBubble(
    //                 clipper:
    //                     ChatBubbleClipper8(type: BubbleType.receiverBubble),
    //                 backGroundColor: Color(0xffE7E7ED),
    //                 margin: EdgeInsets.only(top: 20),
    //                 child: Container(
    //                   constraints: BoxConstraints(
    //                     maxWidth: MediaQuery.of(context).size.width * 0.7,
    //                   ),
    //                   child: Column(
    //                     crossAxisAlignment: widget.isMe
    //                         ? CrossAxisAlignment.end
    //                         : CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         widget.userName,
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black),
    //                       ),
    //                       Text(
    //                         widget.message,
    //                         style: TextStyle(color: Colors.black),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           // Padding(
    //           //   padding: const EdgeInsets.only(right: 10.0, top: 40.0),
    //           //   child: Text(
    //           //     DateFormat.jm().format(
    //           //       DateTime.now(),
    //           //     ),
    //           //     style: TextStyle(fontSize: 10.0),
    //           //   ),
    //           // ),
    //         ],
    //       ),
    //       Positioned(
    //         top: 0,
    //         right: widget.isMe ? 5 : null,
    //         left: widget.isMe ? null : 5,
    //         child: CircleAvatar(
    //           backgroundImage: NetworkImage(widget.userImage),
    //         ),
    //       ),
    //     ],
    //   );
    // widget.isMe
    //     ? Row(
    //         mainAxisAlignment:
    //             widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
    //         children: [
    //           Text(
    //             DateFormat.jm().format(
    //               DateTime.now(),
    //             ),
    //             style: TextStyle(fontSize: 10.0),
    //           ),
    //           Container(
    //             decoration: BoxDecoration(
    //               color: widget.isMe ? Colors.grey[300] : Colorss.indexColor,
    //               borderRadius: BorderRadius.only(
    //                 topRight: Radius.circular(12),
    //                 topLeft: Radius.circular(12),
    //                 bottomRight:
    //                     widget.isMe ? Radius.circular(0) : Radius.circular(12),
    //                 bottomLeft:
    //                     widget.isMe ? Radius.circular(12) : Radius.circular(0),
    //               ),
    //             ),
    //             width: MediaQuery.of(context).size.width / 4.0,
    //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    //             margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    //             child: Text(
    //               widget.message,
    //               style: TextStyle(
    //                   color: widget.isMe ? Colors.black : Colors.white),
    //             ),
    //           ),
    //         ],
    //       )
    //     : Row(
    //         mainAxisAlignment:
    //             widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
    //         children: [
    //           Container(
    //             decoration: BoxDecoration(
    //               color: widget.isMe ? Colors.grey[300] : Colorss.indexColor,
    //               borderRadius: BorderRadius.only(
    //                 topRight: Radius.circular(12),
    //                 topLeft: Radius.circular(12),
    //                 bottomRight:
    //                     widget.isMe ? Radius.circular(0) : Radius.circular(12),
    //                 bottomLeft:
    //                     widget.isMe ? Radius.circular(12) : Radius.circular(0),
    //               ),
    //             ),
    //             width: MediaQuery.of(context).size.width / 4.0,
    //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    //             margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    //             child: Text(
    //               widget.message,
    //               style: TextStyle(
    //                   color: widget.isMe ? Colors.black : Colors.white),
    //             ),
    //           ),
    //           Text(
    //             DateFormat.jm().format(
    //               DateTime.now(),
    //             ),
    //             style: TextStyle(fontSize: 10.0),
    //           ),
    //         ],
    //       );
  }
}
